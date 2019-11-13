Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA196FB003
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 12:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfKMLvx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 06:51:53 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46804 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfKMLvx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 06:51:53 -0500
Received: by mail-lj1-f195.google.com with SMTP id e9so2191443ljp.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2019 03:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dzFZ3NGLU5pWEQ5vhdR1Mewa/oG5oJkabm/W2LDfL9k=;
        b=DuuMv11R9D+R0ELHFzCYUlVoCX/2KtEreIBfJPhqnpMLVYCFGVK8BHvCotQzG73OH4
         gECxjorxUbG16cqL1av5he5bCG9QynVlxm5u6H6ljn7DIaybvzBK/H8Dt9X4hHNiwRdV
         ZvPwZfFG48oM2GHVpz0rTlOT/I9j4X/HHKCPmquwhWFQetP8JknZug0ZlUR4u28uI/YX
         eHUKY0vO88bVdf9NzPM0kodhYhzBd/rT4VqB/AuclCXvt5Cp4bJJi27bEmcPJYs8p3gh
         XmtmqnAZ5hJuVwsIT8z7fLZO4ME4eJKsNZnMVPf1qcgRqGBHqoeCvpz0PSqRjKlu0Zak
         a+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dzFZ3NGLU5pWEQ5vhdR1Mewa/oG5oJkabm/W2LDfL9k=;
        b=j6DjQR58KZLoH0eKWhA1lpi9C5bwtSvNSjul7/4inKLwtxnbnt2JEGyyEjvCfjPkDB
         +v46jFSNo1d0KA+OVe5Gi2XiQ4s0hysNvpFi/25N9oYc/C+Tggf1/fZCF7gb2i98U2Ae
         0rT+CIqn/rd61nNUiXM9QeVw0A+56XtuAtT60mTBHQeZ7GfFWNrBcTGlOeGlBQR7xB9e
         1QHjPesLE0oTzqD3va4X1s53xGlJvatCQrTed6dGX4Wq+xyXHsj2w7ZQ0l69Y2MBtowb
         3MRdFMW1R08e9q4ym3qxtkq+D5hXambTzaEk2rvQs6DQ32sOFUq5OqcCMSzr7rnfX45r
         yTxA==
X-Gm-Message-State: APjAAAXxc/rJgWPU4xW8ImLDbbDq4V++Y5EwEHNwFbkXrfEPfgzY9ZFN
        szUHbrugQUIYwIBVEhsxwvGXsK3VIng=
X-Google-Smtp-Source: APXvYqyq2szCAGBncqkgaKS9/5Mp8FLHPKyIs0TQfMUGOR+CjX+6IImKCoKZou7oR3wxcrI7mbMR8w==
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr2274920ljj.248.1573645909646;
        Wed, 13 Nov 2019 03:51:49 -0800 (PST)
Received: from wasted.cogentembedded.com ([109.167.219.12])
        by smtp.gmail.com with ESMTPSA id 4sm968198lfa.95.2019.11.13.03.51.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Nov 2019 03:51:48 -0800 (PST)
Subject: Re: [PATCH v2 2/2] phy: Renesas R-Car gen3 PCIe PHY driver
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
 <9e69a1ea-b52b-4295-c898-e1ac4df26f97@cogentembedded.com>
 <20191104132743.GA13342@vmlxhi-102.adit-jv.com>
 <48467080-9c49-fd64-c39a-6e379f21b639@cogentembedded.com>
 <20191106121051.GA6564@vmlxhi-102.adit-jv.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <dffb5706-035a-98fc-fa24-98d550a45454@cogentembedded.com>
Date:   Wed, 13 Nov 2019 14:51:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191106121051.GA6564@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 11/06/2019 03:10 PM, Eugeniu Rosca wrote:

   Sorry for a late reply -- I'm on vacation.

[...]
>>>> This PHY is  still  mostly undocumented -- the only documented registers
>>>> exist on R-Car V3H (R8A77980) SoC where this PHY stays in a powered-down
>>>> state after a reset and thus  we  must power it up for PCIe to work...
>>>
>>> Indeed, this [1] PCIE PHY driver looks entirely V3H-focused and looking
>>> at the "Table 54.5 PCIE Controller Phy Register Configuration" in Rcar3
>>> HW User’s Manual Rev.2.00 Jul 2019, _all_ except one PCIE PHY register
>>> (PHY_CLK_RST) exist on V3H and no other Rcar3 SoC.
>>>
>>> So, except PHY_CLK_RST, this driver appears to be doomed to R8A77980.
>>> Ironically, PHY_CLK_RST is exactly the register we now need to manage
>>> to implement "Internal Reference Clock Supply" (HW man Chapter 54.3.14).
>>
>>    Do you have in mind a working approach to switch internal/external clocks?
>> phy_set_mode()?
> 
> Thanks to Andrew (CC), the approach is to implement a new binding
> "use-internal-reference-clock" and, based on its setting in DT,

   So boolean prop... should be OK.

> write the appropriate value (0) into the PHY_REF_USE_PAD bit of
> PHY_CLK_RST register, just as described in Chapter "54.3.14 Internal
> Reference Clock Supply" of R-Car3 HW manual. We don't employ the
> generic phy_set_mode().
> 
> If you are fine with this approach, then we will try to find some time
> to push Andrew's patches to you in the following days.

>>> Just to avoid any surprises on our side, do you see any issues in
>>> extending the driver to the whole R-Car3 family, even if only for the
>>> sake of controlling the non-V3H PHY_CLK_RST register?
>>
>>    Depends on the previous question...

   Wait, I don't see why we should support all the family. The PCIe PHY
registers don't exist on each member of the family, according to the
manual. Please continue using the chip spoecific "compatible" prop.

>>> [1] 2ce7f2f425ef74 ("phy: Renesas R-Car gen3 PCIe PHY driver")

MBR, Sergei
