Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B144BAA7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Feb 2022 21:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245610AbiBQUBg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Feb 2022 15:01:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245615AbiBQUBf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Feb 2022 15:01:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF7C1662E1;
        Thu, 17 Feb 2022 12:01:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 53E4FB82387;
        Thu, 17 Feb 2022 20:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE3AC340E8;
        Thu, 17 Feb 2022 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645128077;
        bh=1/5hRAMumWZvZceDjvo8Z2SUq8cMuUSNeza7UqhGeR4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JeZKAsGQJDdUiIqPzbOMqo1Prt+tLiPdmUjD4q1glVvLshra/G6lNeZ3YU9lC5fNn
         iIsaRjc7y13fL04hKFrXe7D0bb4pdpqLgcLTMdcf9zw9AGAqNClFrHMUui10MJWOQr
         abnKUHdMFAG2To/hILK6VJExZ2ZPXjNIIS20PxVbrCHUcV0J7QtTVfoanHBTIbW0zS
         Ke/MH9Mwug7oC1U9IpafqALS5cCHFCWn5H1c+g8Ljyb01/+maFU2XXkK4noVPrDtIR
         IP/Fy51NiPHD+k3ioFzt1aIfIwURXzBcimQlJTf87nKB4GVMxE28iwg4vJXklcPKNX
         ktY2iB0ZDFzHA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1644594116.git.geert+renesas@glider.be>
References: <cover.1644594116.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.18
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 17 Feb 2022 12:01:15 -0800
User-Agent: alot/0.10
Message-Id: <20220217200116.DFE3AC340E8@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-02-11 07:45:26)
>         Hi Mike, Stephen,
>=20
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac=
07:
>=20
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.18-tag1
>=20
> for you to fetch changes up to a1bcf50a99dd1e40f0c6a963bd4f12547a89d4cd:
>=20
>   clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC (2022-02-10 14:34:5=
8 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
