Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E65B7CA2F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 10:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjJPI6e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 04:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbjJPI6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 04:58:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98ED8B4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 01:58:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44946C433BC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697446711;
        bh=FVlzKdkhbVh9N/JYCCY5N9wSb/ETjh4QaFHnI885+mE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jvjTiB583yaaJab0KTp70GgVD5MN2PYGRxy+Q2EjjKpdqr+gHtM8SpuiiYP9eZJB6
         65KbZwU40hgdQbNG8VZsccHwJg3kzLv4YUHsRB4DPanNv90VlqUMvMdiDIybB6OflA
         DBJpgeT1hOGeSNF9ra5j1JUYPCSXIPhk7U6m++kcPrGr/dfhZL9oNNiS54WrOsqBjg
         HvWHDZ/XbKuD+PrnbANbT8d6BQRF17LvRDCt0Ng+Po102ZX2qj3/Ymmc6wFUdeVnV+
         sb+sSxAN87+JtgBJ2/BXHLguej+LckJQ1fWo5+1DYlXyEdY2IQqdz+EdVqH0WKQ0BP
         fPAo4P3lSqDzw==
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5b5354da665so305542a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 01:58:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YyYAwIwPO/PoPxb8kF9R976tDfi1+BUjGRFXmjGVgyFSNsH5rJi
        T4/3ZcF0lZ55hByq1esqMHxE4McycJBc6qULH1fHIA==
X-Google-Smtp-Source: AGHT+IF0dH+E4iRL1ATyZdgOpqAKjDow1ZApMe7Grdp4tpvczPCF0AuTrdebh7+8LKPOx98vXrgZTIq2piUVcOiJTR4=
X-Received: by 2002:a17:90a:8404:b0:27d:1d1f:1551 with SMTP id
 j4-20020a17090a840400b0027d1d1f1551mr8979649pjn.29.1697446710582; Mon, 16 Oct
 2023 01:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com> <20230830142358.275459-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-6-biju.das.jz@bp.renesas.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 16 Oct 2023 10:58:19 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7P4ooXeD_EGmMbGu-wtGaZjpbZ6N-Lkan+Q5GE4z-dQw@mail.gmail.com>
Message-ID: <CAN6tsi7P4ooXeD_EGmMbGu-wtGaZjpbZ6N-Lkan+Q5GE4z-dQw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm: adv7511: Add reg_cec_offset variable to
 struct adv7511_chip_info
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Adam Ford <aford173@gmail.com>,
        Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 30, 2023 at 4:24=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The ADV7533 and ADV7535 have an offset(0x70) for the CEC register map
> compared to ADV7511. Add the reg_cec_offset variable to struct
> adv7511_chip_info to handle this difference and drop the reg_cec_offset
> variable from struct adv7511.
>
> This will avoid assigning reg_cec_offset based on chip type and also
> testing for multiple chip types for calling adv7533_patch_cec_registers()=
.

s/for calling/by calling/ ?

Reviewed-by: Robert Foss <rfoss@kernel.org>
