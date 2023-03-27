Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D45F6CAAE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 18:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjC0QoF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 12:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjC0QoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 12:44:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A713826B9;
        Mon, 27 Mar 2023 09:44:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 36D79B81732;
        Mon, 27 Mar 2023 16:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8C3C433EF;
        Mon, 27 Mar 2023 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679935439;
        bh=608T/nN1KekMz4WHv3ljTL+uQ0TtOSt5VLp9DXl/7qE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=f+Gii8D4vfTId/YvlQhp15KlnFStbXJk27/Fn8KUXzyv6XQEM8wJ38WKOUEts96pB
         ESRL5liL5vVg94exA0EEkKF/o3I35emoz+KioT0+7bLNTBy2JolwUkA97SecYP91ZL
         Yq8MWoVg3/FSE/d5R1e82t36FhgcQuV8jAOj89qcTqjD56yiluQELuq1Kf2XK681Ch
         ohO0t2/myVjQUfZ2pxXCO5tCysy22xovaNiiwBVd9mhByu6uR2utqpt/4qUoUsgcq7
         eL/NU7HlDZaUsIFbJm+JjZAp8c4dolUgSs5xi+K7F7lkhWDBLOLTUJEgXhN1zOJ9Hu
         LDpN2m0PuW08A==
Message-ID: <5b3de62616c790f751e93c235929abef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1679907532.git.geert+renesas@glider.be>
References: <cover.1679907532.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 27 Mar 2023 09:43:56 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-03-27 02:03:01)
>         Hi Mike, Stephen,
>=20
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>=20
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.4-tag1
>=20
> for you to fetch changes up to 72cd8436ece036294322fecf91567fef3ce3e868:
>=20
>   clk: renesas: Convert to platform remove callback returning void (2023-=
03-16 16:54:21 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
