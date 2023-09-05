Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F557930C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Sep 2023 23:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242339AbjIEVLQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Sep 2023 17:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241639AbjIEVLP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2023 17:11:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2773313E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Sep 2023 14:11:12 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-500a398cda5so5169320e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Sep 2023 14:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693948269; x=1694553069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef2qFmNn3xvEcf4Oez9oM77hxc0tHJu7wEpJkm7cD0k=;
        b=A1LlaS/xXK/50tzUNIDkH0A6F81s0j1fpIWB45quLX/3CesolIeqyE0+5+W/kUrvXP
         blrk5Cvjw9CttGEND9h5L+xPfRCeWN0qHBZhhgwVYf180k3p88eo63FY7jGxW2QAqz76
         r4DH+HN8L6Dv1eMWtmh+4X1c70+CcD00YdJWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693948269; x=1694553069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef2qFmNn3xvEcf4Oez9oM77hxc0tHJu7wEpJkm7cD0k=;
        b=c2MmjVPnjRIBaTo1/LXtiOr+ORZ+am9aVPonVvNLgiUR+/ywVQ4pIofD0Y3H5hFnzX
         RedGNDyDP5p+hyo6kfSZDBnBdSfNogKKPK35VKUoLDOAXKJ7UauEXk7PRoNN0JUPh5PE
         QueiPp8OxH45v2yRH6h/UZOtbfnHTZmNGx+0CPCBl1ueJGjgLORzHAF5OLjY04exMItQ
         dhlLhaB7QqXzPavV2IhylSRlj7i9+361lT8DREQ1OG41FLDrlDExa1K03HW9lR7MRtD+
         XECbwhPYPMZISSGlhbM/rhtZuyilDtBOSSNSTRkj+laIp56AjxGl69pcj6rGV0J96ONM
         EmSg==
X-Gm-Message-State: AOJu0YwwLZJAUGKD0kE/PBmwn+YX+/B9XT8WJ14tTuE2417pl7L7p6sK
        klkfKjnqcpvKwxwneTYWKjadSh6EoUiMOi1kfl1/WT/o
X-Google-Smtp-Source: AGHT+IFFQc7CRGLQc5BWXe8BnUfq2zisWopdRy+izWtdRy9Csm6uTbiBrZOJP0dzhi4LA86MafuqOg==
X-Received: by 2002:a19:6d11:0:b0:500:b5db:990c with SMTP id i17-20020a196d11000000b00500b5db990cmr582070lfc.57.1693948268974;
        Tue, 05 Sep 2023 14:11:08 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7d496000000b0051dd19d6d6esm7597747edr.73.2023.09.05.14.11.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 14:11:08 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-402bec56ca6so31995e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Sep 2023 14:11:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3502:b0:3f7:3e85:36a with SMTP id
 h2-20020a05600c350200b003f73e85036amr11498wmq.7.1693948267775; Tue, 05 Sep
 2023 14:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid> <CAMuHMdWOB7d-KE3F7aeZvVimNuy_U30uk=PND7=tWmPzCd7_eg@mail.gmail.com>
In-Reply-To: <CAMuHMdWOB7d-KE3F7aeZvVimNuy_U30uk=PND7=tWmPzCd7_eg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 Sep 2023 14:10:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WufC0WrnEZVEi5vQudpGnxiphJpJ6SwsEitm8zEnzJiA@mail.gmail.com>
Message-ID: <CAD=FV=WufC0WrnEZVEi5vQudpGnxiphJpJ6SwsEitm8zEnzJiA@mail.gmail.com>
Subject: Re: [RFT PATCH 15/15] drm/renesas/shmobile: Call drm_helper_force_disable_all()
 at shutdown/remove time
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     dri-devel@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>, airlied@gmail.com,
        biju.das.jz@bp.renesas.com, daniel@ffwll.ch,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, paul@crapouillou.net,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Sep 4, 2023 at 12:28=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Douglas,
>
> On Sat, Sep 2, 2023 at 1:42=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> > Based on grepping through the source code, this driver appears to be
> > missing a call to drm_atomic_helper_shutdown(), or in this case the
> > non-atomic equivalent drm_helper_force_disable_all(), at system
> > shutdown time and at driver remove time. This is important because
> > drm_helper_force_disable_all() will cause panels to get disabled
> > cleanly which may be important for their power sequencing. Future
> > changes will remove any custom powering off in individual panel
> > drivers so the DRM drivers need to start getting this right.
> >
> > The fact that we should call drm_atomic_helper_shutdown(), or in this
> > case the non-atomic equivalent drm_helper_force_disable_all(), in the
> > case of OS shutdown/restart comes straight out of the kernel doc
> > "driver instance overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > @@ -179,12 +180,20 @@ static int shmob_drm_remove(struct platform_devic=
e *pdev)
> >
> >         drm_dev_unregister(ddev);
> >         drm_kms_helper_poll_fini(ddev);
> > +       drm_helper_force_disable_all(ddev);
>
> After "[PATCH v3 36/41] drm: renesas: shmobile: Atomic conversion part
> 1"[1], this function will already call drm_atomic_helper_shutdown()...
>
> >         free_irq(sdev->irq, ddev);
> >         drm_dev_put(ddev);
> >
> >         return 0;
> >  }
> >
> > +static void shmob_drm_shutdown(struct platform_device *pdev)
> > +{
> > +       struct shmob_drm_device *sdev =3D platform_get_drvdata(pdev);
> > +
> > +       drm_helper_force_disable_all(sdev->ddev);
>
> ... and this should be replaced by a call to drm_atomic_helper_shutdown()=
.
>
> [1] https://lore.kernel.org/dri-devel/fd7a6702490bd431f314d6591551bb39e77=
e3304.1692178020.git.geert+renesas@glider.be

Ah, thanks! I will put this patch on hold and check back in a few
weeks to see how things are looking. If you wanted to fold it into
your series I certainly wouldn't object to it, but if not that's fine
too. ;-)

-Doug
