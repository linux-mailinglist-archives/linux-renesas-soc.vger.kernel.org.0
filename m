Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0AF619351
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 10:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiKDJUr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 05:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiKDJUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 05:20:45 -0400
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05466248DB;
        Fri,  4 Nov 2022 02:20:43 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8B17F580511;
        Fri,  4 Nov 2022 05:20:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 04 Nov 2022 05:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1667553641; x=1667560841; bh=SJoBz4HEVE
        RiFUnQzb3ZIub9dT0AONhBbUZgzTI8xuQ=; b=jOAioEcqTCQaB6i99azVot5cAk
        gre11Ve+vBmc+Fs/vkDIrNjCSzfHPOUS4wzGCXwfIKJy9biOGQnW4iqxv75LAqbt
        RdYq92O8WI8weSFAZzxtnrW2XuUukmSBN8KcaYYLkhR8/jLD6oh6MJQ9cwWd7yl8
        mH21fZUTzBP3gaoYiV4qH0o52fq8RuYFTCOdHa7Soal92hUHyLnB5uIHP9R7ZXTY
        yrk8ucJVboxa6GlUfb8qItPWrs5N4B3xbNfDaXknJzA5ZsbLT0XMXiOZj0LDZKk8
        6WHRFTqWjdbWEHnXA5Wxg4OS34kfyJ+czE32JS893SSJ8vebcjylW97lvLOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1667553641; x=1667560841; bh=SJoBz4HEVERiFUnQzb3ZIub9dT0A
        ONhBbUZgzTI8xuQ=; b=BmHXv8dWgMDB3A30MW7r0ER+x2KPnCs67D5Tm4znOHms
        KOvE21G5Qhp1IrhrNpstSMDDbjbRSKKI+wikCsrQUA1D/bc3nhsP6Pfph0Q2sq/L
        w5xrS9CVegwYB6hNxnfcyAYSDOlMngVd/4QaY9exxV3aeJMS+7bUlXh8ZFR6fpSK
        gPa2Xr8LydLZo5vJzfOV1L/TUvE6+ISJhz2GoZweOm3SeuEKaa51K7Ium5W5K020
        eA1TNoxWdJRVK08gDXfqjSbR39bjBE0aJEu+l1hoD12ykpSVSlQ8ZDa9eXuaf1Sv
        VIUPNFOv24w/xRDpe00prXWHte2pkStlJDT70gy7rw==
X-ME-Sender: <xms:Z9lkYzSrjU71xNBk6_zqZw7_YH6JI0yUseZ9KPinXiiMwa2ms5wZNA>
    <xme:Z9lkY0y5CO55EwHV9Y6MI53sDiK8VD6-UVJ3Kx8hhf4HE2ApNz1-y8IkyXw6-f9C2
    r627sGDwec4-VUhbl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Z9lkY42FoeE9AWZWaTBjKK0WgCtTsBwtE9dvMmUqE911tjOLuc_EpQ>
    <xmx:Z9lkYzD3odg97j_NLZJAinYScUOubW4GrxI_Sg6mxaH40a00usXu3A>
    <xmx:Z9lkY8gjj31U7LlNshlCvQUZGUTi1_xePFBMFsKDj6YaX8-3AvZpfA>
    <xmx:adlkYxI9rlur3V1K3bRsxhvV5OL9Go-r-JYQNksdhAr5r8wa1PdT3g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 17FD1B603ED; Fri,  4 Nov 2022 05:20:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <6b35d496-2313-4fd9-851b-2ba469bc9261@app.fastmail.com>
In-Reply-To: <803778517.2279639.1667493436959.JavaMail.open-xchange@opme11oxm02aub.pom.fr.intraorange>
References: <20221019161831.3864786-1-arnd@kernel.org>
 <m2r0z3h5yr.fsf@sopl295.home>
 <7d9eebc8-39b6-4dc1-9ffc-f17ec584bee2@app.fastmail.com>
 <803778517.2279639.1667493436959.JavaMail.open-xchange@opme11oxm02aub.pom.fr.intraorange>
Date:   Fri, 04 Nov 2022 10:20:20 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Robert Jarzmik" <jarzmik.robert@orange.fr>,
        "Arnd Bergmann" <arnd@kernel.org>,
        "Robert Jarzmik" <robert.jarzmik@free.fr>
Cc:     jingoohan1@gmail.com, "Linus Walleij" <linus.walleij@linaro.org>,
        "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        marek.vasut@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Ulf Hansson" <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        "Sergey Shtylyov" <s.shtylyov@omp.ru>, alsa-devel@alsa-project.org,
        philipp.zabel@gmail.com, linux-usb@vger.kernel.org,
        linux-leds@vger.kernel.org, slapin@ossfans.org,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Miquel Raynal" <miquel.raynal@bootlin.com>,
        "Mark Brown" <broonie@kernel.org>, linux-mtd@lists.infradead.org,
        "Lee Jones" <lee@kernel.org>,
        "Russell King" <linux@armlinux.org.uk>,
        "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
        linux-input@vger.kernel.org, mkpetch@internode.on.net,
        lgirdwood@gmail.com, "Vignesh Raghavendra" <vigneshr@ti.com>,
        "Daniel Mack" <daniel@zonque.org>, kernel@wantstofly.org,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, sre@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        patches@opensource.cirrus.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, "Felipe Balbi" <balbi@kernel.org>,
        "Helge Deller" <deller@gmx.de>,
        "Alan Stern" <stern@rowland.harvard.edu>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, perex@perex.cz,
        linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        lost.distance@yahoo.com,
        "Haojian Zhuang" <haojian.zhuang@gmail.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>, tiwai@suse.com,
        "Dominik Brodowski" <linux@dominikbrodowski.net>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 3, 2022, at 17:37, Jarzmik Robert wrote:
> I'm sorry Arnd, my mailer messed up again, and instead of using my 
> normal robert.jarzmik@free.fr, it used my ISP mail ...
>>
>
> The reason you're not seeing the AC97_BUS_NEW used is because this 
> becomes visible only in device-tree files, which were posted (for 
> mioa701 for example) but never properly reviewed nor merged.
>
> As from memory, at least mioa701, zylonite, em_x270 are DT ported, ie. 
> there is a DT file which makes them boot. For the mioa701, the DT file 
> offers the same functionnality, ie. all drivers in mioa701.c legacy 
> file are working as well in a DT variant (not using mioa701.c 
> obviously).

Ok, I see. I need a little clarification here, so I can adapt
my patch series to keep the necessary files in place:

- Zylonite has both PXA300 and PXA320 variants. I removed the PXA320
  code because nothing selected it any more and it is not hooked
  up to the MACH_PXA3XX_DT Kconfig symbol. Should I undo this and
  keep all three PXA3xx variant, removing only PXA930 but selecting
  CPU_PXA310/320 from MACH_PXA3XX_DT?

- The em_x270 board file was already removed as part of 9d3239147d6d
  ("ARM: pxa: remove Compulab pxa2xx boards"), which already removed
  the associated drivers. Is it correct to assume that the DT support
  for it has also become unusable at that point, or would you expect
  it to still have some use? I now remove the related CM-X300 machine
  as well, but it sounds like you did not have DT support for that,
  right?

- I'm not sure how the probing of the ASoC drivers works in the
  DT case. Do I only need to make SND_PXA2XX_SOC_AC97 user-visible
  to let everything get probed automatically from DT, or do we
  need to also keep SND_PXA2XX_SOC_MIOA701 and SND_SOC_ZYLONITE?

>> Any idea where I went wrong here? Did I make a mistake in following the Kconfig dependencies, or are some parts of this
> incorrectly annotated?
>
> I don't think you did a mistake, I think I did. When I saw the patch of 
> "deprecation" of mioa701 and all the other pxa files, I took it that 
> the platform-device was deprecated, and was to be removed. This is the 
> right thing to do in my opinion. I wouldn't mind if all board file go 
> actually (expect the QEMU one), as this would leave only the boards 
> with proper DT support, and would remove some clutter from the kernel.

Right, this is the plan: the only board files I left in place are
'gumstix' family that is supported by qemu and has the largest amount
of RAM in there, and the 'spitz' family that is also supported by
qemu and apparently had at least one user that was interested in
working on DT (I can't find a record of who that was now). 

> I also thought the drivers won't get touched by the purge, exception 
> made of "platform similar ones", such as in the sound tree 
> (sound/soc/pxa) where we have some of them, and maybe mfd tree.

I made two lists of drivers here: the first list is for those that
become invisible in Kconfig and can no longer even be compile tested.
My reasoning here was that these are likely already dead and will
only get worse without compile testing. If anyone ends up doing
a new DT conversion of a removed board later on, these can obviously
get resurrected. The current state of the patches is in [1],
I'll go through them again based on your feedback, but let me know
if you see anything else that I'm removing that you think should be
kept.

The second list of drivers is for those that have no DT support and
are impossible to get used without anyone declaring a (platform, spi,
i2c, ...) device in source code somewhere. The list is still
incomplete because this is hard to check automatically. I have
included a few patches to remove drivers that have been obviously
unused for a long time, or never had an in-tree user at all, but
I left the majority of these drivers for a later series.

       Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=boardfile-remove&id=73c4b7cfbc2b2ef0
