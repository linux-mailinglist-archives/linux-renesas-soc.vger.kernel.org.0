Return-Path: <linux-renesas-soc+bounces-11144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D905F9EAEA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 11:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39125188A0B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 10:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AEF212D89;
	Tue, 10 Dec 2024 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVUmsYB6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B686B2080EE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827654; cv=none; b=uIbSdT3hlfHgQU/qHGMjbWDQGImwe+C0+TUXba0lPKqXuaS8xhWU6WF56z7cgCjQf24DTr+YTiaHndkrV5Smf2zwznozKawRPLYQek6h2vg5Ima3HHmW6R973PgoPwXKx4lfqOMcvvdLSvnsa6lxwF7ni0PWaTf1QBVJIeSrXvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827654; c=relaxed/simple;
	bh=Y6HOPzsah2UWH+doev7j6bx01djyqo2znX5vVNM5uw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bIQ4NdRuX5cr2OSOaGgNlMSEa6WPceQmJmOCsAj7qnprIoAop7QCNuasxUb9mFHgi+8TmI27PmEUOL4FLmIRNIhywSO8crG3Sj8oazp8/OPdjPy7YvYAoY8zLeXebqHhtY0NCaZ+3+3W7/6nUhJRaKBWiy9T07MaxbsVe1TyTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVUmsYB6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ff976ab0edso51513901fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 02:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733827651; x=1734432451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQDk0aXlh4sHYVGoJtmtywLEY715ubkw6Pu7A3p8NKk=;
        b=ZVUmsYB6+7B56ej2gFSH+V0OBnFVCs0RIkFjVGUAuReA86A1s2Koz2HnBdnL6NMRbo
         2OenBL1VX9oNsgxJ1k3k8tESf9wT8dZ942PwT7LMrtdQ2MWgW0elmrQh5Ef5jLogM3u1
         K2VkBL9NrHmPh6vkHQyudWjRAy0lywhKBZSGwkZ3Id0pPl6mCE36OV8x3zZCqTVrmZlW
         f007+K7OkMMHeYJfp8/yqt9wiupAJHDY6m4Y0vtUrRHUVc2EalEf90ScN8YpM5gyxPil
         Ho7uoKj3IWYV8/5VGumItf361dx/wln7qIBRuKIuMeByA+nkotmnSASNayHKFG6D3PFb
         ysjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827651; x=1734432451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQDk0aXlh4sHYVGoJtmtywLEY715ubkw6Pu7A3p8NKk=;
        b=PrJsGYYi8MKoqN3GDy9u1y54i+klKNZOeNaLeVeBjkh7YW/vh6udKrtBKhg8dVVc2A
         wYYgOojIqQA/X7nxu9XIliG/tWNbijT1QvUn3kCcohZ2XWLxxgG2Z5gKhsBDxh2xd/al
         gb72G8+/I3YmnXdyyBGT5HxtxQ9JaaeYPPKZtL01UMUs5jWi4MjSK46X3pwYEaW4bMqg
         K261hesBBwVfSzqcQQl1GdO00dJ0GkLYZoboU2Qmnp1t6VphrdULEVofXzdiflR+D1mX
         vcWN2QASmtVZiwsZiuiUWkjVonQcJLG8Udm5gyHkFkWSOh2PXHTajPKQS+DOtcKH0fVh
         kjyA==
X-Gm-Message-State: AOJu0Yy4iaBcpD0l525XHlMTKGYKDMTtJR7x/Nr0B01pHCdfN6bmaTAp
	1wsQIi7nf/3kbOoqNCKmLZnNYV/77OmohkK1bmEmmZPP4DngkPFRIecnzvVrKjA=
X-Gm-Gg: ASbGncsjwXUxISz2JdG4zrm3SxBmluS1b6xASMEcb90ADwzME/NmFR2ZqTwwL8Z4D2X
	3iGuCQ8KJVhMFmecnFj1Fxc2nimPbFpNPiD69m2qDRMwO8SD8RpQneEtf55PePRh09fsEg3dp/o
	tCsCKiN8Z0hq0saJ0ZUAjZa5jsSWbK9xH91/AFfs7ehgOj0s5IKRJMWxkTJdW/e+6+fV+a9dvf2
	WCtHQ8uuMeF9lXf2zLvHveTmFI9+LvuMWST48r7ZBdVpF17QI+c1y6F2KV6BBzU0qMFPYNQTh5W
	WpqIYSS4R9yZiiWW7qs2OQ==
X-Google-Smtp-Source: AGHT+IGF344Ued8JrzMd5L5Ep4dJci9pWWxlvAO7/v42icTHNWYLEYvoA1QE8P0FlmPmE+R6xjI7Qg==
X-Received: by 2002:a05:651c:154a:b0:302:264e:29e9 with SMTP id 38308e7fff4ca-302264e2d96mr25784281fa.37.1733827650857;
        Tue, 10 Dec 2024 02:47:30 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3021cbf8d0esm7343141fa.55.2024.12.10.02.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:47:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
Date: Tue, 10 Dec 2024 12:47:26 +0200
Message-ID: <173382759311.2854279.4096374868344930210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
References: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Dec 2024 09:02:10 +0100, tomm.merciai@gmail.com wrote:
> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA-24
> format by selecting the LVDS input format based on the LVDS data mapping
> and thereby support both JEIDA-24 and VESA-24 input formats.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: ite-it6263: Support VESA-24 input format
      commit: 919b1458ccfd33ead891fa4ad1e1d06016f5a20c

Best regards,
-- 
With best wishes
Dmitry


