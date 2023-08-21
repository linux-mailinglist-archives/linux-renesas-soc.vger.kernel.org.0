Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDE9782888
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 14:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjHUMGO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 08:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjHUMGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 08:06:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83EEBC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 05:06:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 361116326B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 12:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4870BC433C7;
        Mon, 21 Aug 2023 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692619571;
        bh=/405IyGtz9uQHDcRiIjBLZ1n/TpnUBYmu+d63qAE0Do=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=jGcedVNzU9GUzoHNk8mLgLFUHnWjAzMHY2M82p8bQnOWub0VcHpaaHzTIkBChemKV
         /eVCuEh6vcyT5AOamOXVLsfD3q6Tl1JBKri4lWvd8o9O2sL9c9x+ksx9DAU3SgtOex
         LeV4XEgOYdtaQayx61vMQUKqhsb2IY+BdeyR8qte1bhIQUbCIol+Awff8J0osPLdqp
         MFGId2VknUfrIlTK2LklfUxav4ADo3LwAbXBeSMxvXjADbmpSktDvBToyFfxDZdsZk
         asCZx/yUSARUUHG3SNkNBsLgMfPHfvBCXoXZFZt8QzezJMuJciCYsFDfFqsp0UgCo3
         EiqoPeNUmeWIQ==
From:   Lee Jones <lee@kernel.org>
To:     Lee Jones <lee@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230819183155.22335-1-biju.das.jz@bp.renesas.com>
References: <20230819183155.22335-1-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH] mfd: mc13xxx: Simplify probe()
Message-Id: <169261957000.1563783.13916739565680727085.b4-ty@kernel.org>
Date:   Mon, 21 Aug 2023 13:06:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 19 Aug 2023 19:31:55 +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device() and ID lookup
> for retrieving match data by i2c_get_match_data().
> 
> 

Applied, thanks!

[1/1] mfd: mc13xxx: Simplify probe()
      commit: 2c1375064ea6e62d529e9d545292537a0b21dbdf

--
Lee Jones [李琼斯]

