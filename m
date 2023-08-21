Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED46782890
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 14:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbjHUMH3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 08:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbjHUMH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 08:07:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914F0C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 05:07:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 252BA616FC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 12:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4F5C433C7;
        Mon, 21 Aug 2023 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692619646;
        bh=zGmtyE3wziH+BTor1BJZgPsTf0Yg4SFKy1P90DsWDdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PutKvFqqstGNaJuGNpPeVT8KU7o8jx+b5XMlFKKW1IOyPA1tNPsByNuoXlCqsj18X
         Tl75QKf5Uc6FohG0qIHDTz85ICV2gPRVioWVjSSKpXKPTy38tCZJiucHjkQrOR4Nyh
         U5NICb4/Xb5yqtlzkb/7Evy507oPOqRzX7/Y/GhqhYgzL+Q7x0Lb+w1iTuXNdcknEe
         3PMSu9KWK/7X3DbSU04hflZDEsuLXcjQK65/OP3BqztCc4sc4oItCagYMiitlzA3jI
         ZLGhuRm3161L2aofbJot9Hlo01nTQ6sC3h95azBrXMyLo75+UWmWizsNRMgF3FuAIj
         PNg8uKpqbFdDw==
Date:   Mon, 21 Aug 2023 13:07:22 +0100
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: mc13xxx: Simplify probe()
Message-ID: <20230821120722.GG1380343@google.com>
References: <20230819183155.22335-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230819183155.22335-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 19 Aug 2023, Biju Das wrote:

> Simplify probe() by replacing of_match_device() and ID lookup
> for retrieving match data by i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  * This patch is only compile tested.
> ---
>  drivers/mfd/mc13xxx-i2c.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

I improved the inadequate subject line before applying.

Please ensure subject lines are both succinct and forthcoming.

-- 
Lee Jones [李琼斯]
