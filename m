Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFC3AD721E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 11:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729770AbfJOJWk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 05:22:40 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41593 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729043AbfJOJWk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 05:22:40 -0400
Received: by mail-wr1-f68.google.com with SMTP id p4so7023987wrm.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2019 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2je19/jggqbWGMcPX5ioTjzRrP7lElzkm+gR+CMtb1s=;
        b=t6ymZoFbHyXWn7joBIpKhc1/Fk7hGoXzMT7H0wq4ZeHllCiAji04Xri2PLIyIEe0K4
         aV6Hd+5tLEJuEjhpZeMxPh8uWPYl5fmPcVXoNvUvMWxnL3HIDs5SQsJOka8gOtVcgJyu
         bTpCLu48QLSl0y06glXhzj3r6eN+YadDUz6uElqozVW/mfDvsLeeRm/I9qRi/tkmMXAO
         9WF1Cuo7ga1gWqH2yhmo/ZMPYfPMdTUcgNEOM5+x7JLI7uA72NdHfzZDfWEzN5Aohpz7
         2Uy6krH2/5nS8XW+mUcWCpiOi7ozFkAK89bTklLmSPjCTPV7snMkcD/xR1vclSk1E6hX
         /MhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2je19/jggqbWGMcPX5ioTjzRrP7lElzkm+gR+CMtb1s=;
        b=PBGDkZ8hgbSrKlNggYeXThfipw10rPDCWxp2KTlKV2+F7d8Q8cA2tPkOcph9IW7p4T
         BPT/eIMeTaJmSzGaNgeIMPursm0y778lY6znwNfs83yh3J1ZJb9y/87a1y270uckshAF
         4tD8Pvdx+YlUR6pio8pRyOCYHgiSkca2JbsZBPqCTjQPnZX5hv30YitHpl75kth4T6oh
         eS/bcIHkK0zQcNBi8fvsw23p4Ea1LQUJ/6j8E/HPZ9J87eWwg65eHnRbXRgt7Pvo9jIY
         06y8kXbGYkU09Cb3eyZT84DJL2FX/pMF9Oun9uuu8OnsfmDoFRyFN3R7rpYXv1O9PFI8
         KjQQ==
X-Gm-Message-State: APjAAAWwewNEJLEhILPpccPLyr++rVJ4+4a8GjSw3LiuuiPJQ2Uh3W/f
        ajvzpqXVRKTdeKLpPLGeiUsfI/fgxGxx5pgO
X-Google-Smtp-Source: APXvYqwtTGnp6OslciBY1LUwBRbdzvF4fDuwq90HSlfX12UVnZt+lZAJaFSOB1eOJV7AXXat0IRRuA==
X-Received: by 2002:a05:6000:1283:: with SMTP id f3mr27844709wrx.370.1571131357654;
        Tue, 15 Oct 2019 02:22:37 -0700 (PDT)
Received: from [74.125.133.108] ([149.199.62.130])
        by smtp.gmail.com with ESMTPSA id z6sm19523901wro.16.2019.10.15.02.22.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 02:22:36 -0700 (PDT)
Subject: Re: [PATCH] serial: core: Use cons->index for preferred console
 registration
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <4a877f1c7189a7c45b59a6ebfc3de607e8758949.1567434470.git.michal.simek@xilinx.com>
 <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com>
From:   Michal Simek <monstr@monstr.eu>
Message-ID: <7284590f-2b74-1b47-2d61-783ad8d5f46f@monstr.eu>
Date:   Tue, 15 Oct 2019 11:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 15. 10. 19 11:19, Geert Uytterhoeven wrote:
> Hi Michal,
> 
> On Mon, Sep 2, 2019 at 4:29 PM Michal Simek <michal.simek@xilinx.com> wrote:
>> The reason for this patch is xilinx_uartps driver which create one dynamic
>> instance per IP with unique major and minor combinations. drv->nr is in
>> this case all the time setup to 1. That means that uport->line is all the
>> time setup to 0 and drv->tty_driver->name_base is doing shift in name to
>> for example ttyPS3.
>>
>> register_console() is looping over console_cmdline array and looking for
>> proper name/index combination which is in our case ttyPS/3.
>> That's why every instance of driver needs to be registered with proper
>> combination of name/number (ttyPS/3). Using uport->line is doing
>> registration with ttyPS/0 which is wrong that's why proper console index
>> should be used which is in cons->index field.
>>
>> Also it is visible that recording console should be done based on
>> information about console not about the port but in most cases numbers are
>> the same and xilinx_uartps is only one exception now.
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> 
> This is now commit 91daae03188e0dd1 ("serial: core: Use cons->index
> for preferred console registration") in tty-next.
> 
> This has been bisected to break the serial console on (at least)
> r8a7791/koelsch and r8a7795/h3-salvator-xs.
> 
> The line "printk: console [ttySC0] enabled" is no longer printed.
> The system continues booting without any serial console output, and the
> login prompt never appears on the serial console.
> 
> Reverting this commit fixes the issue.

Sorry for trouble with this patch. Can you please point me to dts files
for these boards and also what's the value you have in uport->line and
uport->cons->index?

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

