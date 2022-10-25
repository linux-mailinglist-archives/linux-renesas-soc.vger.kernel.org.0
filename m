Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0322260CA8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Oct 2022 13:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbiJYLE7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Oct 2022 07:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiJYLE6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Oct 2022 07:04:58 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5675018F;
        Tue, 25 Oct 2022 04:04:50 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E1B1E5C012A;
        Tue, 25 Oct 2022 07:04:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 25 Oct 2022 07:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1666695889; x=1666782289; bh=nCDiQs8ijC
        79Fler4P6ielyRcgWuzph8Yk6V5AQaW9g=; b=NLbvz8bk/J8vEbM/9ygAZAuo9b
        KKNCN8oac/CqsjPRMfhZ64eBiAAgJyGYZcmyJJvZ9Ooy9qhhld/mMT9h/acLB7+S
        uQMM6CBn7wnucpDKYhkI5UG1T0S6Wsu/nxOBzmcKYpF0rxMRgnPLTTSPVvcQWUEy
        zzy8fCrb6e20tWnanJelpk35OvAfQJ+W77nMrm2PILLy6m9q9MBYD0/QjUlo1SEa
        iIp+lKBPsuCBrCm9jR8bCxl0yP6gHQgZMc49bYCCrR8ibTKU9t5hbJeM72UD5Axw
        y4+s2fMOnewXAl/oaKaNoOB5Y5hAREijqXoe7Ycg9kBj3D2Ud+kqI7gCI2Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666695889; x=1666782289; bh=nCDiQs8ijC79Fler4P6ielyRcgWu
        zph8Yk6V5AQaW9g=; b=hJBCmG/sIfwBOVgQIAvpJCalppaPXl6q6Wn2UDZFXnp0
        mmPlEwvMPICz63zVuhAABW+M7//q3V98j9HErWkVAzlsEDc8hdyVnk26reMMiowm
        3oHKlN429pfySwjfTqq8N/is8oHjg+Arb/ps4CkoJqVB/IyLF3XNYL24y5GQ4FSf
        SVd3jVUdmhThpmlCQtP+F8HrdofYnXqLEHgk49grPP58Lt2xtD2trVpu92B/Qy9y
        h0B50kT2ezvLNMqqPZH1xtVkRBKUeaXyrIFEc0uOiMsDUskDjX5M8NIdKpLideFf
        ai1yqdwyrmMJrII4UnznOJECx9yWVKRTY9P1l03HgA==
X-ME-Sender: <xms:0cJXYwFW4ol3xaOFHEvlGydG9E40eJS7BT8cDBtA-eLCrpgPxXBEQw>
    <xme:0cJXY5WghX0mSk2Nfj9JOKLAlzxuJqu7agor9syTR3wsRE1RBpZDs2u3dmY-tF6nk
    6lOKSBoD5h-XFbVphk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddtgddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:0cJXY6KV57Z4STPz5eXKQs-9zDeZW7CGU-pUAmR1Pc9LS-IFL5-WhQ>
    <xmx:0cJXYyGuRaPdsnMj5dhyA6Ds4Sdp0ZIDDQdoY3vMRD2owH5xieprvQ>
    <xmx:0cJXY2WOzH-eQS3PaETSUYf6CZJjVyMyByB5waWx0lFpLgCgqlKU3A>
    <xmx:0cJXYzgjM5I37d2RG9W67A8o-4qjkpyjR1NEI_tNH1RB4Pu7FFxRDg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4F702B60086; Tue, 25 Oct 2022 07:04:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <60c3285a-e1a1-4aac-8c6f-23301f7b05e4@app.fastmail.com>
In-Reply-To: <CAPDyKFqA1RtcaGMCQgDsKKju4izHWJRAD12SqqirNm+TWLt_hA@mail.gmail.com>
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqA1RtcaGMCQgDsKKju4izHWJRAD12SqqirNm+TWLt_hA@mail.gmail.com>
Date:   Tue, 25 Oct 2022 13:04:29 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Ulf Hansson" <ulf.hansson@linaro.org>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 0/6] mmc: renesas_sdhi: add support for DMA end irqs
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 25, 2022, at 12:51, Ulf Hansson wrote:
> Hi Wolfram,
>
> On Thu, 6 Oct 2022 at 21:05, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>>
>> Motivation for this series from patch 5:
>>
>> ===
>> So far, we have been relying on access_end interrupts only to mark DMA
>> transfers as done implying that DMA end interrupts have occurred by then
>> anyhow. On some SoCs under some conditions, this turned out to be not
>> enough. So, we enable DMA interrupts as well and make sure that both
>> events, DMA irq and access_end irq, have happened before finishing the
>> DMA transfer.
>
> The tmio/sdhi core still relies on using tasklets. I think we should
> strive to move away from tasklets for all mmc host drivers and to use
> threaded irqs instead.
>
> That said, I am worried that it might be harder to move away from
> tasklets beyond $subject series, for tmio/sdhi, but I might be wrong?
> So, I am wondering if it perhaps would be better to make that
> modernization/conversion as the first step instead?

Moving away from tasklets is probably a good idea overall, but I'm
not sure that MMC actually needs a custom IRQ deferral mechanism
in addition to the existing BLOCK_SOFTIRQ. I would expect that block
drivers usually operate in the context of the blk_mq caller, and
adding in another thread context can add substantial latency.

    Arnd
