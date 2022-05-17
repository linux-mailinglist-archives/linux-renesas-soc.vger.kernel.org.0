Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49055299DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 08:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiEQGuN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 02:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240474AbiEQGuD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 02:50:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB12F47044;
        Mon, 16 May 2022 23:49:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 57E29B80E81;
        Tue, 17 May 2022 06:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C985FC34100;
        Tue, 17 May 2022 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652770186;
        bh=CpWulmZSDl1zLLPbxdVBecEkO+AICzB50qAS3ianLD4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WzdDxiAhxGWBwB3ATM2dApnR2NyrXG3gANE3+xEt1peE8fH7dSg9h1p5Nf44pfVEb
         2FWArY4+PDxRq79AmKhm7y/XlSrRUuYwUY6vKX5iBC8/4EIMb3DazfStUeV0wLDhDl
         5aXQiFMy9Va6Dr3n9M4fJpCKxyOWOfx0W4zdXy9V2KUi6Q4svkROtBdE9AvVvm/bSu
         2W1KbKwg87LXydSUHrshx0ZirPIkKBszmxDmOGm8M9z5a8MyqP8aj2OJrZ1r2AAVLC
         L02/yFzVnefTu6+nPW0tOMKMFsI/W9QzbioH+q3/uHHvO1JLBa6dnH2b1hRjUx8nMQ
         PRMpO3sba24Ug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1651829136.git.geert+renesas@glider.be>
References: <cover.1651829136.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.19 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 16 May 2022 23:49:44 -0700
User-Agent: alot/0.10
Message-Id: <20220517064946.C985FC34100@smtp.kernel.org>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-05-06 02:32:29)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 59086e4193f4fc920a23d2045a473f62450b42=
69:
>=20
>   clk: renesas: r9a07g043: Add SDHI clock and reset entries (2022-04-13 1=
2:30:19 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.19-tag2
>=20
> for you to fetch changes up to 23426d1be3c20907b4f3d72bf95234d4ee254393:
>=20
>   clk: renesas: r9a09g011: Add eth clock and reset entries (2022-05-06 09=
:38:40 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
