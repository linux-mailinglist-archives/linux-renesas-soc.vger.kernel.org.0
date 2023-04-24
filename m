Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B92B6ED285
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 18:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjDXQdy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 12:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbjDXQdx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 12:33:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145E2110
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 09:33:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A282802;
        Mon, 24 Apr 2023 18:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682354019;
        bh=KcIHbcyYvbkajc227Nn8U754N1nQHT3tyc4kfFqIhq8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Dqne2WDRGzFUZDtfY3noblNM1ilty3Nto7f8hVFTPJVu5tfy8bdH2cuG7+6wSlzzs
         /kTKhl1PqKEdOTvT8hxo6Af9w+0h+PgR9+ED5wTZFObTAXBPdeFiSi4v4DAeqEkB5Q
         t4iMxatcxBIxwTV3qS171XNntvOb2fy4y3kiFoAo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230424161024.136316-2-biju.das.jz@bp.renesas.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com> <20230424161024.136316-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v8 1/5] drm: Place Renesas drivers in a separate dir
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Peter Robinson <pbrobinson@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dan Carpenter <error27@gmail.com>,
        Ville =?utf-8?b?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Takanari Hayama <taki@igel.co.jp>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Marek Vasut <marex@denx.de>, Liviu Dudau <liviu.dudau@arm.com>,
        Stephen Kitt <steve@sk2.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Date:   Mon, 24 Apr 2023 17:33:46 +0100
Message-ID: <168235402660.2445904.1033629703665211251@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-04-24 17:10:20)
> Create vendor specific renesas directory and move renesas drivers
> to that directory.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
