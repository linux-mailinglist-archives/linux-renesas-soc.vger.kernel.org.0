Return-Path: <linux-renesas-soc+bounces-22337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1001B9A2A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 16:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ACC41B265F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 14:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C414C2FBE08;
	Wed, 24 Sep 2025 14:07:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335692FE05D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758722838; cv=none; b=D5cJaZshIWoyefnhWQVUziS5T5MoITh+NkhLO9dUCS7FjYWQHiCJcnb3T/mdGmqWBEDga2Mv7Ihv98sLRGIcmPTsPVSkWMU/PtQgX95Z4ZLxW1iBjEyyaVAv6c6djHJRFZnPgNuarrCgnS8/cSm2RaXVFd48U50KBXeHkNSvW4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758722838; c=relaxed/simple;
	bh=HBVkixXC6UpLk/eCQCarn8ygZtWWeyWBTNoBVx3DstY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4gdGOfS0jla9/wDyqBD8hAdEzpivEzxv8rTNCS4uGQ/SL3PfRgDOz/x/bDTlGNW+bDIVoSzDYcAbTdSTTANV/ewRROT79J4hQl8Jkp+h0C/UW2i3u46/a4vkXPgRXdbeKoNyHaPno7WcBQRUg6Z6rF/6ReISSYXInfNlOEWss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4d1c5c3f77eso11684461cf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 07:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758722835; x=1759327635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeMFh8fKXfFfV77chei+2rVcM7wYWs2LWA9oczHhuiE=;
        b=UhQQpsEOyXo8+U/erFrv7xtdj1txNz/wGhVduFOZ+O3ww0ZDrPpsZ0HllQwC84nV8O
         XxdQYMesiovIDyRa1bwFEJ0jAK5IhoEN0qkalVJqQHqhW1mdBU0nJWAjsd30W8/GiP/A
         sldtXMV6JPNBEafOLFtC0b59K57doWTJzhbrPXsbhXNAtLfwcSS5X4wNHZ3oo+Nq1lb/
         xzb/QFdHwK6t85F/8YrMhW5+tKQF2gLsPsKSSeeRgYW7F64upqZjcYUtAXk5epIA81Gz
         EIgvw46hXboqAHlle7j2kkU590lmFf//GxMdbq61sDBzwA0XycFhay9IlNxtm0BV+W2K
         /QzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVahXNnEglNvvQPooMyMWV6nxmiQJZhYBZGh668SOF+lGgEFLKgbgL4Y7uG9iovOPd1ia22naP52oebG08h9HREbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFr1c8XpkqOWY8dUqc1RvypQdPWI0XaE+H0pTqj2UhVhaEvxCS
	6ihzAHWY+Lzc55L6rdEZYnrGJtQlvgZEbAnkM+Tk/TGrdT6giQSyhgfz0v20IwZ2
X-Gm-Gg: ASbGncuU9O3Ngw1X2vhGKWgz9Y/oZMkexHngon8EhLaf6r0jygrMTrIctjNCmkHSqqR
	VVDFBljv6k3QNxFy9Qp8XxdRahrCPIif03/8CtqX4oGgN30jtPbyt+nbz4MZ2BAGSrorwLGyqaU
	DBuUv6oyWSgWxB7y9+PXK96HNcCrEhbfrkFlMsEXyVVkptTsNZ6G9FESVIpYi+nYEKnDs1krU/6
	X3noB+pyW0uiwNZ/p3mWYCJ+p0ZTSYCQZfanHrOl6+2U7HhI2HJf/Fem5UxPmueGic8wLk1DnGY
	oXsqvzDq/gvJOCGv4lHpCBN1cYwH0Cf3Hbi07u+QGBngIz5RdtdlZceaPwdBM6skX5shRxNmj8e
	XhmMH1SsLlwB6vGxPCihQZS7lL9mZYnhwYJFMJbhdx2XkgoxwS79g2p6e/30K9cYS
X-Google-Smtp-Source: AGHT+IHVBRfmTxUdsQ+zUNYW3fYGZRcEZXLpMvPUFAvhImEJjv7PZA6hCgxBAtozMUlDagQrF0sJqg==
X-Received: by 2002:a05:622a:a956:20b0:4d6:173a:8723 with SMTP id d75a77b69052e-4d8585ddf06mr19965161cf.1.1758722834607;
        Wed, 24 Sep 2025 07:07:14 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4d7d81be2a9sm13138701cf.52.2025.09.24.07.07.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 07:07:13 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4d10f772416so10209101cf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 07:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6guNyvQIzDPaPF7wLKmOIVaDTBEKo6FbA78qt55rA+5eOBVtx9Dd/+NF8clIzROezWC7WhdPG8Goa9DZyxFuqTA==@vger.kernel.org
X-Received: by 2002:a05:622a:24c:b0:4b2:8ac4:f097 with SMTP id
 d75a77b69052e-4d85bec4dd5mr30176331cf.33.1758722832210; Wed, 24 Sep 2025
 07:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com> <20250917170202.197929-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250917170202.197929-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 16:07:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw+cVtMkfnWjuO6BUNPRd=gZHhiD=KqPxugrJVLOe+Wg@mail.gmail.com>
X-Gm-Features: AS18NWDN65f91eaOSdFfPam9YAakFHEyWw7q-5E1Mc_B35_vALhwRHePhcWpJeg
Message-ID: <CAMuHMdUw+cVtMkfnWjuO6BUNPRd=gZHhiD=KqPxugrJVLOe+Wg@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: renesas: r9a09g047: Add TSU node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	lukasz.luba@arm.com, magnus.damm@gmail.com, mturquette@baylibre.com, 
	robh@kernel.org, rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, catalin.marinas@arm.com, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	p.zabel@pengutronix.de, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Sept 2025 at 19:03, John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

