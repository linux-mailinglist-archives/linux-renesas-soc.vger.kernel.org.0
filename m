Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0C751C696
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 19:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382917AbiEER55 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 13:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382911AbiEER55 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 13:57:57 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208B528E33;
        Thu,  5 May 2022 10:54:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 538E4CE2F31;
        Thu,  5 May 2022 17:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89492C385A8;
        Thu,  5 May 2022 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651773253;
        bh=GSh1mA8i2G0crwkmWXmxvquL0ZnqaEBkZOwHtQhQzbI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bzfR2GwvmdqAWZJDSESlEOITUDtlkyfQr9niNSfknT8PBpa7OqeUPEFlvhzRRR/VD
         pxKye/o8F/S8HAdovX7UkGYHHeLWTgF6zqoAWXpoEhXeSBE/Nq1/Php80d1zCTJ4ap
         VN6KeQw/wYRbH7GRJ5Y9bfF3pxr9XFCvXePD+1rx+SD/BzZTTBmMAZtyo9FN+R4wmM
         Fuw0KGO0PbLq7rorf/IeduUT2qYPCYmrPoy8KOSBfFDdghZMz96LcLgUb52z4Wp1Sw
         WsLbmHnnVsYXJagYv6HPjKGqEtQJjQvLnMrTqq3JxgUye9JDgq3l+ZvNCBhimbwzsB
         lbQkJ0jUEWB2A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e0eff1f57378ec29d0d3f1a7bdd7e380583f736b.1651494871.git.geert+renesas@glider.be>
References: <e0eff1f57378ec29d0d3f1a7bdd7e380583f736b.1651494871.git.geert+renesas@glider.be>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix OSTM1 module clock name.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 05 May 2022 10:54:11 -0700
User-Agent: alot/0.10
Message-Id: <20220505175413.89492C385A8@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-05-02 05:35:02)
> Fix a typo in the name of the "ostm1_pclk" clock.
> This change has no run-time impact.
>=20
> Fixes: 161450134ae9bab3 ("clk: renesas: r9a07g044: Add OSTM clock and res=
et entries")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
