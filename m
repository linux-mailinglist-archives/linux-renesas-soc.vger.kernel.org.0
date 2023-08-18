Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3AD780D33
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 15:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243343AbjHRN6P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 09:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377604AbjHRN5Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 09:57:24 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D7B49D0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 06:57:05 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-51f64817809so102895a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 06:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692367025; x=1692971825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eD0O1eo+RjvJrk62h4NWlaW04gRCMar9efOFkm7eDQ=;
        b=lGh3nToTHC+xsSzezgysc8IS9bNIwjzuNW6oJk/XqdYCO0Z7VNBWZH3/tKbINys2nr
         wU0TY7gFXOLh7/cykRSO074GhsdKg2+Jegr2UK89lL9N8/edJFRCQU7jWO1HuCMJhhAc
         9kiOOkRCdalnnOQcbav4ZEb+3qMyeqNEKVtpzQyyasBhhYTGc5gtvwcbjblGjlez6NFS
         651pCa8dOG6ZOVaWeDHoPxFoyUe8mS4U7vCQdJJGsZXptVdEvLVLo0xqAC4v+lXndjwl
         KbrW63nZk/oCDG7Ndaoiai89roB4svHF8FrCSKOk7slYnRIWfVUAVEzD2y19fpHKIF9n
         IClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692367025; x=1692971825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eD0O1eo+RjvJrk62h4NWlaW04gRCMar9efOFkm7eDQ=;
        b=DgELjTr3MxSNKSWPpFQbJx5D86eFYqjt0YJYMfVX+iat6SQe5VQjV72vF2OsvMxVa7
         qw9l7rnWDkIbczIL5VyM5mqWrSkagGOWJ4w8hOFPw2rc19cqvKCaid7HkdRRgQSNYy53
         sUmivu+D65YnM6JijfBtyqI1YFl8jnePC0dyJ4uuU0xC/hDGp5t1lM3QRzGv1PkH/QdW
         N8hBCDBa5xRxAGfB/nzngXM6OesIeyvGZvLy0fhdigbh6jSSI9XbpRG67SnE0iViW5j9
         EGNQnBy6gx0Gq1ndzHL4WLCGE+NPKYnPDMBrJ2WXWbuALLBdvSe7wl3ZKkKCupz0TlUM
         82Jw==
X-Gm-Message-State: AOJu0Yxpo29Ijdr5yE5Vdc4npaKJlZXH0n8X+5qd//LWh26hNQylssrl
        W3OCWRFORBET2cVtyjSkQfbIzExsF0nilpI/pVQ=
X-Google-Smtp-Source: AGHT+IHJSy7BpQil2h7W5EZDBkE2OdIgHgRUSkli/M2Y/hys+3q43fMrkA13VMAlIkvPqxqk2lFLTo6P8U49QaR0aPc=
X-Received: by 2002:a17:90a:4101:b0:26b:5fad:e71c with SMTP id
 u1-20020a17090a410100b0026b5fade71cmr2387978pjf.2.1692367024967; Fri, 18 Aug
 2023 06:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 18 Aug 2023 10:56:53 -0300
Message-ID: <CAOMZO5C4dcdjhhVHw1W4zXCv8w7TDwfzVxkt4VZBge-hyzXBRw@mail.gmail.com>
Subject: Re: [PATCH 0/7] ADV7511 driver enhancements
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sun, Aug 13, 2023 at 3:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> This patch series aims to improve ADV7511 driver by adding
> feature bits and data instead of comparing enum adv7511_type for
> various hardware differences between ADV7511, ADV7533 and ADV7535.
>
> This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
> ADV7535.

I have successfully tested this series on a imx8mm-evk, which has an ADV753=
5:

Tested-by: Fabio Estevam <festevam@gmail.com>
