Return-Path: <linux-renesas-soc+bounces-340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D416D7FB8F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 12:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1005E1C21357
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7914E1B1;
	Tue, 28 Nov 2023 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A6F1FDA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 03:05:18 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-daef74513e1so4732330276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 03:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701169518; x=1701774318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oy+o1kVweIOL0AWQDo7Tqifh29KAZj1zX09r8Nx2UH4=;
        b=jBdz9/kfqgA8lhFBKWJBuNbTHGrZKkLUw5tu1fclZswKazvdInMAzEOeMDU8sslYF/
         DwZvQiKDy4TzDbLm9uIp7wsuuTUwZ72LTUHtigNa3edTANujjAN+YKEgu2dMaA1YApm5
         t3sX+hSxo8MH/E9xbHZtU0KqK+sJGU2rE7XA7ApYOlOlsdeuummBMWHk0b++c/XXkr+w
         y1u8nt5AMWzP+kIat6OwnWZ8xuEOGFVUHK+5vS620YQbhFdoPFRUAfdFtIPiBYwaLaZt
         eWbxYR9Wwupf31urT9RPPYvUlCxLvL99V4VGkylMvmLgzLf2zXwtQb5hCUKdXIQ+XMEN
         V7uA==
X-Gm-Message-State: AOJu0YwXyyqDJSsrnI+SzHJE5JTgaL5GhpIO2/4x0xaokpNmw/kHhucB
	5jitZnARIXlMqswXfN1FB4GoJi6L3sUD+A==
X-Google-Smtp-Source: AGHT+IHevPcZ3KCr23ekak7UPWudSomJzaNP4dVOUKXpCHonj+E2pxsu64keuJx/a1Y7alH+LrhydA==
X-Received: by 2002:a25:1843:0:b0:d9a:c503:976e with SMTP id 64-20020a251843000000b00d9ac503976emr12414849yby.58.1701169517537;
        Tue, 28 Nov 2023 03:05:17 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id o21-20020a254115000000b00d7e96c6eaf5sm3603428yba.46.2023.11.28.03.05.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 03:05:16 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5cd0af4a7d3so54559827b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 03:05:16 -0800 (PST)
X-Received: by 2002:a05:690c:2e10:b0:5cf:809e:6b64 with SMTP id
 et16-20020a05690c2e1000b005cf809e6b64mr7788821ywb.48.1701169515975; Tue, 28
 Nov 2023 03:05:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com> <20231128105129.161121-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231128105129.161121-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 12:05:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZGmP9Q3vahYaMWFqi0w4GWdSY1pxiunWtobn5RR1_PA@mail.gmail.com>
Message-ID: <CAMuHMdVZGmP9Q3vahYaMWFqi0w4GWdSY1pxiunWtobn5RR1_PA@mail.gmail.com>
Subject: Re: [PATCH v15 4/5] MAINTAINERS: Update entries for Renesas DRM drivers
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:52=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> The rcar-du has never been maintained in drm-misc. So exclude only
> this driver from drm-misc. Also, add the tree entry for sh_mobile.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # shmob_drm

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

