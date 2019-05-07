Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBE51647E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 15:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfEGNYi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 09:24:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45027 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfEGNYi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 09:24:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id c5so22318352wrs.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 06:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LV78HryqvnHABV5jpxM1QC5TdOSg41p2X28ZKiap3P8=;
        b=KBJRhHLsRLKDMI4oKKbqmpHgrEzkTqjcKlW7B6ywzxDa021AUm56Dxibudlzigxy0d
         bXMr3pTBzkClrlxAzbURcDt/2rE64ohwRyDVhMCpkjAxF7lOs/lFgc+V8MWq6WvgMhyf
         UJYvoQN8JfjEKjYdY1YtNXoIxwLLZq3951sotFEdwV0NMwxq6qfjv1XNEBvhiyUqgtr8
         h1Y+8t35zHUcu/3nxakdcHswIbsuhqEPDPtIecHxlRMG8/nQIk8zZYdkeMIttJ+NAjEd
         HGD9KhGYNy+oqkST3jRAD3pIpHLzmKXgq8F2Ug49tvaTcdSR4s2+nkVgzFmtUXfxO0A0
         MTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LV78HryqvnHABV5jpxM1QC5TdOSg41p2X28ZKiap3P8=;
        b=X9Y6mEsUG/UkUQhSdjAdrS97G1jJ0xFT+GiLZIQKJH87I3YCHgj9DguD+sivJaviK8
         GbhUMlH1+yQEKaIKXINDeJbtJS8rL9Q4XKI8JZX9CT7aQXk4geizoBa7L/TfPRFsGEpE
         vS81Vt0TXbaYs4FQVjyz7wsF3x24PLvWFoRID19cz/aGD6Hm3mlkNX9AO4ISEFNVb89Y
         3SUx9Gd9Y8w7JSwcmGofZ6pA6phtHsN+TJaoV+OdOC2uxRuJ1NdYnSkUtowfrPlS3XYr
         gkBJ9wviuqC2OewG8vNu+55jtoF+wvANG4Q4ivY9GX7uGnYzddjG0q8VMpP32vrTudDO
         m0Gw==
X-Gm-Message-State: APjAAAV6kcWjMsujkFC/tHiRvseIzhgAr1BWb1z8rmtIlPm7Nu75w5M0
        eRNgw2Dg1C94otOy4dBtxI8=
X-Google-Smtp-Source: APXvYqyTNYsjXI5yfGnmpKo6fdo18yafhntqvVfAZFT4ELzEt+2TsRz0ktXHLnWvyCcVYZ656h9fzw==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr23405575wrq.103.1557235476341;
        Tue, 07 May 2019 06:24:36 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c131sm11741874wma.31.2019.05.07.06.24.34
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 06:24:35 -0700 (PDT)
Subject: Re: Automated/remote flashing of R-Car3
To:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     u-boot@lists.denx.de, linux-renesas-soc@vger.kernel.org,
        Michael Dege <michael.dege@renesas.com>,
        Gotthard Voellmeke <gotthard.voellmeke@renesas.com>,
        Adam Bass <adam.bass@renesas.com>,
        Bastian Farkas <bfarkas@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Philipp Ahmann <pahmann@de.adit-jv.com>,
        Simon Maleyka <smaleyka@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <20190507104115.GA27355@vmlxhi-102.adit-jv.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <79ae01fb-6945-05c5-a08d-92aaffeaa6f0@gmail.com>
Date:   Tue, 7 May 2019 15:23:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507104115.GA27355@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/7/19 12:41 PM, Eugeniu Rosca wrote:
> Dear Marek, dear Kieran,

Hi,

[...]

> 1.c Use OpenOCD
> + Presumably same advantages as using a Lauterbach
> + Based on Kieran's https://github.com/kbingham/renesas-jtag
>   and on Adam's https://github.com/ntfreak/openocd/commit/1afec4f561392
>   the solution is currently in use.
> ? Any ideas on the model/price of the JTAG adapter?

Any FT2232H (the H is important, due to MPSSE) works.
I like Flyswatter2 from TinCanTools.

> ? Not tested. Any patches needed on top of vanilla OpenOCD?

http://openocd.zylin.com/5149 and related ones, it adds RPC HF support.
However, there are two problems with this:
1) Even with buffered write, the programming is slow
   - This could be improved by running code on one of the Gen3 CPUs
     instead of whacking registers via JTAG adapter. I believe that's
     what lauterbach and everyone else does too. The data upload to
     SRAM/DRAM is fast via JTAG, register IO is not great.
2) LifeC locks the RPC HF access
   - This is a problem, since the JTAG probe cannot access it once
     it's locked. There might be a way around it, but it's rather
     nasty -- use boundary scan test mode to either flip MD pins or
     access the HF bus directly and bitbang at least erase command
     to wipe the first few sectors, then reset the CPU and have it
     drop to SCIF loader mode, then stop the CPU and reprogram the
     HF (since the SCIF loader runs in EL3 and does not touch the
     lifec settings.

Neither of 1) and 2) is implemented, but can be implemented if there is
interest.

> 1.d. Use CPLD Configurator
> + H3_M3_StarterKit_Configurator.exe is a Windows tool shipped by
>   Renesas, hence readily available, which allows to modify the MD
>   pins, to conveniently switch between QSPI/Hyperflash/SCIF
>   boot mode from a GUI
> + Most of the advantages pointed out above
> - ULCB-only solution (i.e. does not apply to Salvator-X)
> - Requires a Windows host

Where can I obtain this and are there sources / documentation available?

-- 
Best regards,
Marek Vasut
