Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A52E784B2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 22:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjHVUMH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 16:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjHVUMH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 16:12:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5408CE9;
        Tue, 22 Aug 2023 13:12:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49CB162259;
        Tue, 22 Aug 2023 20:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4ABC433C8;
        Tue, 22 Aug 2023 20:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692735124;
        bh=Z+UH7WwFq8zaCz7Jk3ZDoupjuTJC8V1XbNWIEfgKxjs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bjvfDyG8ARfyy77ddS9l4WXgPznWOmfB3M0Im/csR0VPMYjS4kg/Y1LZ+TdQu6wWM
         nlJpnqwBqJWXwHosXpJMPheR4ESSgCTy2AxwvEneWOwaty2r5B4oaf1WG9QxEFw/Ow
         WR3ybPYi7QntRxjLvps+FU2K9O4H2SlnF2alUZo1aC+a9jp1DH3vL3RCrNcOk0T+B/
         NKtkCfG7LY1wX0I/Ycf1AmE7oTTnZFrWSr4+zq4HgYNRRj9L3xhce9U5upAow1S90B
         FgOQrZoWOeFs16lUtZumEMp0pRG3zKXsupZivgkUuKs9K1yY935ayvVdpq+/PGGC2h
         Mi4zIb1MhorHg==
Message-ID: <02cf8e599cca056c3a767565eaa1c999.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230721070019.96627-3-biju.das.jz@bp.renesas.com>
References: <20230721070019.96627-1-biju.das.jz@bp.renesas.com> <20230721070019.96627-3-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] clk: vc7: Use i2c_get_match_data() instead of device_get_match_data()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 22 Aug 2023 13:12:02 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-07-21 00:00:19)
> The device_get_match_data(), is to get match data for firmware interfaces
> such as just OF/ACPI. This driver has I2C matching table as well. Use
> i2c_get_match_data() to get match data for I2C, ACPI and DT-based
> matching.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
