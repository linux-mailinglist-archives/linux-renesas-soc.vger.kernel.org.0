Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB50068613D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Feb 2023 09:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjBAIGL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 03:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbjBAIGH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 03:06:07 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8DB3C3F;
        Wed,  1 Feb 2023 00:06:02 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 7579A5C009C;
        Wed,  1 Feb 2023 03:06:01 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 01 Feb 2023 03:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1675238761; x=1675325161; bh=05fE/HK6Dq
        vQfuvfJUrtINoSrSYug5Jz6pNScpWDd9M=; b=gdDAzdJnUgARfIEeRZCLlY2AtO
        v74aILYBuJUkN5gVMmUtlosl9ppOfH60aqfSoj07Kl6G7zkPDXIcc1Tn7WqGsCSY
        JHWRmXGc5FjMONZaMfY5WnKfh4+yNPKjapKm7nBNB4gkUJE1FMz0/yaIXkasXZYr
        Bc1mldhanJo4qytC7b/hiwGs9IV4mRSuggQP/az3Ybajn7Z0am77Hnl5ZJMZym3H
        vWd/exHbA6TIoDYIzC+RjUXaZJ1HDmXkDOaZTvPw4zzphBjM2enPEEOSrQOYwuoZ
        QZzR+YVnbCYoWnucl0BxQmxUZqRR2YZ+y9GhCgcrf+tynOql1uNkVhNyJ/cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1675238761; x=1675325161; bh=05fE/HK6DqvQfuvfJUrtINoSrSYu
        g5Jz6pNScpWDd9M=; b=XnK7mTbGT+y2VJPvrPrYkQusdgUqVG+arE0ljbCtLobt
        xF7R0hFy26tIba5+FFbfuDjPITdtTJywip6T8hEWQUscePYDJ7v+IzjQsead5HQg
        j54GeZEWOtyXWA/zoi+NWPqgM8vaodQf9A6s7F1nneQc3xLQ1dR1G0GAPw2gaY3A
        WPculnNFTznKCI1DJmPz7teFuBAB/N4B5VAWHrsG9g28p+n5bGtTj1P7xc1sPsgN
        kGqaf5MdAfjxWayKoHJX6lVgBfmZ4BOer/Mj44RDf6m3Rn/sqIhLcUzccNIJVMOR
        0K/E/yN5n+IJMexHT8W4XElTCgy+E91qRKJz7KE+ag==
X-ME-Sender: <xms:aB3aY0kNRkhEsKKc7NW05bFZlBy0UWXoQG814K_VbXZ6oRacZ0YgdA>
    <xme:aB3aYz1aBYvMbdLtkMaXJsJdBRmcsfPlBVZMlSTXO070uA5tuWD7Sbpx8jfRoAg3S
    R9KeXnnBzq6L5r9fR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:aB3aYyqS9g0SH2SwMkDNfyVSdWwWQ_3vkD-Y8I2CJK8T08FGcXImjA>
    <xmx:aB3aYwlk6ejAUhE8GGyoNRtrsjcSfpj2rncyHbwPj8DgBJQQXj9lsw>
    <xmx:aB3aYy1yzx3pB_HtgiksIP1tWk8igi724QtNhtyVToNDcf8KbDHNCQ>
    <xmx:aR3aY4PmUfRE7zHhmGRTa3xNtxToXlz0tv-QKwHcrevHDVzY3GqBPw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4D56FB60450; Wed,  1 Feb 2023 03:06:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <b064f754-4d94-4c0d-ad27-e0ad223d022c@app.fastmail.com>
In-Reply-To: <11BE997B-93C7-4D38-99BF-FD025A1FB945@jrtc27.com>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
 <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
 <Y9fhOFEV0kS9U06/@casper.infradead.org> <Y9oHT1D1X9cdHLr0@infradead.org>
 <11BE997B-93C7-4D38-99BF-FD025A1FB945@jrtc27.com>
Date:   Wed, 01 Feb 2023 09:05:41 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Jessica Clarke" <jrtc27@jrtc27.com>,
        "Christoph Hellwig" <hch@infradead.org>
Cc:     "Matthew Wilcox" <willy@infradead.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Geert Uytterhoeven" <geert.uytterhoeven@gmail.com>,
        "Fabrizio Castro" <fabrizio.castro.jz@renesas.com>,
        "Biju Das" <biju.das.jz@bp.renesas.com>,
        "Chris Paterson" <Chris.Paterson2@renesas.com>
Subject: Re: [QUERY]: Block region to mmap
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 1, 2023, at 08:05, Jessica Clarke wrote:
> On 1 Feb 2023, at 06:31, Christoph Hellwig <hch@infradead.org> wrote:
>> On Mon, Jan 30, 2023 at 03:24:40PM +0000, Matthew Wilcox wrote:
>> 
>>> Before we go too deeply into it, how much would it cost to buy all of
>>> these parts and feed them into a shredder?  I'm not entirely joking;
>>> if it's less than the software engineering time it'd take to develop
>>> and support this feature, we should do it.
>> 
>> The above suggests this is in no way an actual hardware problem, but the
>> stupid decision is done in the M-Mode firmware.  I think it is very
>> reasonable to simply not support the devices in Linux until the firmware
>> is fixed.
>
> No, it really is a hardware spec violation. Virtual addresses within
> the magic range bypass translation with no way to turn it off. The
> firmware is being (has been?) patched to block those accesses at the
> physical memory protection level so any attempt to use those virtual
> addresses will fault, but if Linux wants to support this cursed
> hardware and its gross spec violation then it needs to forbid any
> allocation of the VA range.

For a local build of an embedded system it's probably enough to
set CONFIG_DEFAULT_MMAP_MIN_ADDR and CONFIG_LSM_MMAP_MIN_ADDR
in order to force userspace outside of the broken address
range.

If that configuration can no longer run most regular userspace
binaries, there is probably not much need to detect the hardware
that needs it and do this automatically in the kernel, beyond
perhaps some platform specific code that refuses to boot unless
the config options are set this way on the affected chip
revisions.

     Arnd
