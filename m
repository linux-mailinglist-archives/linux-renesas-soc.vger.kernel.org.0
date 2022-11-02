Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883FA616B5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 19:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiKBSAB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Nov 2022 14:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbiKBR7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 13:59:54 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64441DF02;
        Wed,  2 Nov 2022 10:59:52 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 74CE9320099E;
        Wed,  2 Nov 2022 13:59:50 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 02 Nov 2022 13:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1667411990; x=1667498390; bh=7GRoQxQ5O/
        7M/hCgn9KlfgoFjwoQ1yifn3eO5z+5VOY=; b=RXn6bWm7GTfW/yAE4+dGVwwgy/
        UW8G0WWZva+W4EXS4eBCoztfMzY7FwruoLXM6zYXuvlIgLofLsVG1Lr4Fa77giS6
        1SAU4NMJ3Y2mthTFIxYMMODwTVn8zdXoG7VYbAHu77s9/79Il4vPpFFS/hLI/fkF
        J1NfpnA9SMXi1wpInq0oHLhbooOemddUqB+X6MpenRAK2/XrreqMQXf8hx79Bqa+
        AYeNavWelj5jR3nI4YQj7bnxLYpO9pkeNfIa5yvspDpAx3lKcAZDqoc6JSzS25Ys
        ZAj+Vx0E89R4+/zO60lRhrzLvaHizqTX6BDD8kDueRHUmVEpgHN4J+xeIFbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1667411990; x=1667498390; bh=7GRoQxQ5O/7M/hCgn9KlfgoFjwoQ
        1yifn3eO5z+5VOY=; b=ZrNtGnGJTkmajqMkJHdYo+u/cTYmUJ79yfOzoYFEzs1n
        kRLuuuXsCdwk5N25zf3F31znCZAzbWRz7l4/IaiioigNJuMufUR+jWved/1Biyo3
        iB+RNggbCX6j0erlJ7Efbyx/94JbngFthBQFvDMyrVTtiUhh//9MNG7vIOBN2G8v
        ElqUTSyH7Ouv1xOOEwVUbHSGwYg++OpNvcdteFcZ+1pr6EH5qvU86wJ0eHwDigLw
        Yf9D++8KGGdCYQGwSN46KZ6xXk8IMZqBbeISGbht4o5pyNSLXzE6boMtOGvfgieU
        LBVBdWbWdKJdNLE96qsKMq6sFhz2NUcQ4Prven3Yiw==
X-ME-Sender: <xms:FbBiY4wxCdWrv6f0_bkEiMl7Kb-f6ysnHjSrW-RaTBVPKWaTvoH71A>
    <xme:FbBiY8T8c1SAIwBlrhDunEMcuS__JbmPZb6YFC0_pUIRz0k0sTNraUGF0WGfA-wPa
    ev9Y37qbOszLaYtqK8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FbBiY6UPix6nnvEq0TY7cN55-1OemKmGO8icLhV7msNgJqzaSC_x9w>
    <xmx:FbBiY2hTQ7g01Xx7Ja1EjeZnaTMnGXJdV0738-4-9sQUVh0T5IqGog>
    <xmx:FbBiY6C3vUHt7Hnfeeq7WepyxeCtGX5GvuLHCEqYimzKHbgo7LPCng>
    <xmx:FrBiY1qcyjSY84IEFydVqf4Z3AbN3kV67bT7TG7Vzd-6wl-3ne43rw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BB6C5B603EA; Wed,  2 Nov 2022 13:59:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <5b882121-f129-4130-bd5c-507072463a41@app.fastmail.com>
In-Reply-To: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
References: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
Date:   Wed, 02 Nov 2022 18:59:27 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] mmc: tmio: further cleanups after kmap_atomic removal
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 2, 2022, at 13:54, Wolfram Sang wrote:
> Thanks to Adrian's patches mentioned in patch 1 in this series, we can
> now simplify the TMIO driver a tad further to ease future refactoring.
> This is marked as RFC because testing the corner cases is not so easy so
> extra eyes for review are more than welcome.
>
> Thanks and happy hacking!
>

Hi Wolfram,

I haven't posted my PXA boardfile patches yet, but after that
series, the separate tmio MFD devices (MFD_TMIO, MFD_ASIC3)
will all be gone, and tmio-mmc will only be used by SuperH,
Arm MACH_RENESAS and MACH_UNIPHIER. I hope this doesn't conflict
too much with your work and instead opens up further cleanups.

       Arnd
