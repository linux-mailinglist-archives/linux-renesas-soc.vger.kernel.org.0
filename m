Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A33A6007AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 09:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbiJQH0S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Oct 2022 03:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiJQH0R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 03:26:17 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D088359715;
        Mon, 17 Oct 2022 00:26:16 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 8E5D63200201;
        Mon, 17 Oct 2022 03:26:15 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 17 Oct 2022 03:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1665991575; x=1666077975; bh=QxZFt3QBmH
        IoQfMp/FC9LEPOpzpCYtGddTyuGXfMHts=; b=sO+2EouwX94ev8P02yO6A8A4Fz
        QPHBOZPd3awl1SI60x3BWux0l1iP9kSRH3ZOcBVnzUbIynoGVTSp1rDY74PdqFnF
        PiYjFPnlTg/1LyA3xb0b6NL4R2ALp6ufuaTydHqFEZ+Rr8t95J+0fmGm+UNR19ur
        JJ8ZO3gkNR5S7C3FHqdgK/XZGsTl2soOBeJdhQ+CicMwLEWdJ5Guc5V2JuyK+qVQ
        1bm3y8BhviT3ddT9SXJnrmDdnBxYfmX+ie/jLgdNTkfd3i1/26s2gFmPfc3AdNOx
        DInUtbWuc/EekyIA/ZZTRUxXruwatiF/TTcJSS9d+LwKIaJp4elKq47cER8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665991575; x=1666077975; bh=QxZFt3QBmHIoQfMp/FC9LEPOpzpC
        YtGddTyuGXfMHts=; b=F6TGgT+U5mxBhfmWI/7vgTwLeAClf9ELsI1oZdgbZMUi
        x6qkFKch8JbwdMdk1h5n+9Jtr0FSB9mlWoYQUQ/CKV1v+g4fWDr9iS8h3S7Ypbdj
        xkTrU3VfbJtXXmBPkZEEpZl5DmYDBSpIk74YphQR4zDFVEhLetBojwskAxKQeJg3
        /NSVd/ddlUJYvNF3zC+IFuqGF6k1QAAKv2ntXrwvKLyQk0fSSF4Ha9HtvVV00Zuw
        tzF8sH94t6EtBh1nzIHybzALlwPo1ceVMRsrnRJAMnyCwYqzMGncwcDu2hlK6biR
        Q0sOu8dAr8zZ9x309dZlNw/eu7Akbp1CwXz7S++VNw==
X-ME-Sender: <xms:lgNNY-6Q4eNxu4_LyqbAqTCriFFoYhHoqNxNnGGgkZpdHdPD9bCAFQ>
    <xme:lgNNY36lnvbZzwN1nVeD5qxlgtifFEceKCOYQybcJ4-6uBtFU2blshPpVOgH1Lqlh
    t95REm-zp5k6PbeVno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekkedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:lgNNY9cCxFWtCINwBFeYvmvm8xFIVwDkJyfJZDWJFnEVr9Vh84jI1g>
    <xmx:lgNNY7LLGfQ0IoZHI2C_STOsFWLd6ODxUU3HcXwAAIc4bj2j8yR1jw>
    <xmx:lgNNYyJrWXwva8_DBqkJFUYYy0I0Vz_FwumY-vv6VJKnviuBPVSTCw>
    <xmx:lwNNY68NrTbNl4HD4BbR4HCcksGTDavbBDb6QWVXj9A5fr-6FHn5Ag>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2731CB60086; Mon, 17 Oct 2022 03:26:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <b93fb33e-5835-4c20-9781-68a1bb58bd78@app.fastmail.com>
In-Reply-To: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
References: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
Date:   Mon, 17 Oct 2022 09:25:53 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
        linux-ide@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        "Patrice Chotard" <patrice.chotard@foss.st.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "Sergey Shtylyov" <s.shtylyov@omp.ru>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>
Subject: Re: [PATCH 0/6] Fix compilation warnings
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 17, 2022, at 5:21 AM, Damien Le Moal wrote:
> Several patches for 6.1-fixes to dwiaddress fix compilation warnings
> thrown with CC=clang and W=1 and depending on CONFIG_OF settings.
>
> Damien Le Moal (6):
>   ata: ahci_st: Fix compilation warning
>   ata: sata_rcar: Fix compilation warning
>   ata: ahci_brcm: Fix compilation warning
>   ata: ahci_xgene: Fix compilation warning
>   ata: ahci_imx: Fix compilation warning
>   ata: ahci_qoriq: Fix compilation warning

Whole series

Acked-by: Arnd Bergmann <arnd@arndb.de>
