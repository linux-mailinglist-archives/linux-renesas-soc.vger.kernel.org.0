Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 687B21101C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 17:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfLCQFD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 11:05:03 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38930 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfLCQFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 11:05:03 -0500
Received: by mail-lj1-f193.google.com with SMTP id e10so4442841ljj.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2019 08:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ISxgLk82KYg9gcCYMQW4c3ORz6YkAHuAhHBO9CgaMTE=;
        b=EpZg4MNfgVquGvO4fH/X5H+3P+UFIyXs1dvDST18rfRasIrdEob3Vz7delQ08QikL9
         HwLUZjCnZcsKyEi3G8SToHRvBaZdnFFcsPnG4k/5YWG/cwZB1DsyOMnn3iHOgJ5jBhRF
         0/tv0b27SOMfdHAAS9uvvyzYHSvJz29jXZ8Ghn8P74JIXgbqiQ8Xmf3E7xd0IOJWjYpt
         v9k8TskKjI/UpljG8OYXfqRkCLbkH8b4DSia7T8a+v1EfZoGxKC3CBVYnqYDmqJFopMg
         3Xur2LBWPfoAUY+YgoW9CnTNt3+RV4Uwq2EleIYU8L5WljjTjJj4DuITTMBVU0AW9mEM
         J5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ISxgLk82KYg9gcCYMQW4c3ORz6YkAHuAhHBO9CgaMTE=;
        b=UzuISBBVg+LpONznj1bIiGGYs9dXKbV6kriA7Up5E6u+NEJm/Eq2FRsB1xEGfCH8CW
         cUqWj6e/Yl0xIoYnE7LoD/z76yyATBq+w5u021Yc0z+ihqgiS/2+8nJva1S6Ufey2HoZ
         SuOxrgaovY1ix3oHEtqqJT6xqa+1+9AbrUR8aCllnd4/TSgCQdmtnqMgkfKE+YDbuljb
         dsyAqUkBIFjxz7o/idFTnnUU8x2QW9uTrrfFBHjTvfo8hqm/fiY/uthIsfebtD7DYYKT
         2HbRNglmRB9LnBG+F2RIOaDASw+ZeMhIUcZwfZgmcpu8E03Ltx0Pkv6A1YWDe959m0fy
         1BAA==
X-Gm-Message-State: APjAAAU1iHhsPIin95DkuwxaxkhsXb+v+DxrgPfPTOFzv5h/o3Htk/h3
        r6UNAXDy4NKqd5k3Ebk2onztWA==
X-Google-Smtp-Source: APXvYqwyp3PFALxnKddtKsL8vY1KS7etYmE6Qhye0Iq2Sqts4Tc5bj5UbJeYQy+vhfctVJQU7uj6RA==
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr3018520ljj.243.1575389101408;
        Tue, 03 Dec 2019 08:05:01 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:6d1:3848:12e:c7de:68cf:5575])
        by smtp.gmail.com with ESMTPSA id y192sm1791884lfa.63.2019.12.03.08.04.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 08:05:00 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 6/6] dt-bindings: spi: Document Renesas SPIBSC bindings
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191203034519.5640-1-chris.brandt@renesas.com>
 <20191203034519.5640-7-chris.brandt@renesas.com>
 <17e66541-41fb-26ed-c87b-15c59ab57bef@cogentembedded.com>
 <TY1PR01MB156262E8D33A0624457CAE248A420@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Organization: Cogent Embedded
Message-ID: <6c2cb15b-896c-e749-8b33-02da46fbc222@cogentembedded.com>
Date:   Tue, 3 Dec 2019 19:04:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB156262E8D33A0624457CAE248A420@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/03/2019 04:27 PM, Chris Brandt wrote:

>>> +- flash: should be represented by a subnode of the SPIBSC node,
>>> +	 its "compatible" property contains "jedec,spi-nor" if SPI is used.
>>
>>     Are any other flash variants supported?
> 
> Do you mean other types of SPI flash?

   No, I mean flashes connected via different buses, like HyperBus with the gen3 SoC RPC-IF.
If SPI's the only bu supported, there's no point saying "if SPI is used".

[...]
> Chris

MBR, Sergei
