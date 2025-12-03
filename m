Return-Path: <linux-renesas-soc+bounces-25529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCC9C9E9A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 10:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 711973499B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EF32DFF1D;
	Wed,  3 Dec 2025 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OhBCPqfP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8350D2E041D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755702; cv=none; b=qj2Kqhf8r9dPMqwkDZ1t/hkDHqn4r9oGzebkYWoyD0TiN5MDUMXPQY8E7HflRdcyJ5XS3gVy9/Lmuyr8ynfQc7rIZmPmPYrBrZKRHh912r7+EJDCbeFZzoHNzVavLLpppyL6kZTWeRoFLIAHt0qNoz9qF2FvAHAGZVacqbztKnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755702; c=relaxed/simple;
	bh=bf6xekrcsFMQsZdm4tiPKUq/zdj8GQcGkChPb3cjYAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsVXKikJhpVTpOMCYlgD+V2DB7WV7P3Eu6GEClrsrP6PCiojAStfCb4qKkgcShMpuIMi9VJkJtz2tcAilFA6Y52lrF1mLtMgugvnfDijFy4a0I3+nGOtGXrf8bCqm1XyepQQ+ybDuhpcAd2wDqRPLbJPxn4+j6mDicwWWzQBH28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OhBCPqfP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5957db5bdedso7648808e87.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764755698; x=1765360498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf6xekrcsFMQsZdm4tiPKUq/zdj8GQcGkChPb3cjYAQ=;
        b=OhBCPqfPEnq4NYle/5z4aqhxWk+Kg8Ci/9PaAA9BAJs3Fqj6ZBVuAYraVKLNFGcOVC
         lN4fLiN8w71v2MuXde7VNSHf+JPOoLhmYZRdMW2unPy8pHLuya6AhT3bRLlQXY4tdgsy
         juSzFFNV1aauKGLM7Y8KpgQ/vBi3dH+lbGNVsuWrjL2eqFZAam0m5R+TOvcpzlwyVXga
         D1Rw4qMO51wx3XDZdIYEVtIy9z+Spvv+XfVUs6dKNnBDBDMEGoJn9MHdTTBRfmraRf9A
         vJkmBQKS1DbxwzDo4IqIXu5IqwNfyHIGHPbiGDJMLC29CyV2rzQrRlGo/NGjxSz2ASnt
         mGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755698; x=1765360498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bf6xekrcsFMQsZdm4tiPKUq/zdj8GQcGkChPb3cjYAQ=;
        b=ZXkir1kb6G76yYmoTDeCbYugokA5AKlgGMZmedjo/cT+bqR06AKBdDBtBamZbB4JXl
         NmX3es6D5cQK4v6ytPnZTHjMNB2SrkS6tdzpQa4IPns0ienhtcPCjJU+PLN1yzWQ+0Jx
         QusSTo9X8CYxDiL4nJgHl3KrymBpnObyPD/0lT3y0WtGWjSZrg7qklRJez7/KFiziXGX
         Cheh+NLBufWnilwwCP3XlaAk6at0k+xUcwT88xxyFXf5fo9qf3tTfAtX/mCWZJGIY0iN
         idmq3bqt7ozMBKIfVexHu+80sxAwEi0pLyFAFYeWnxSIpvME1KaCiwrKLvsRSMC6A6op
         i1SA==
X-Forwarded-Encrypted: i=1; AJvYcCUTq9pCpnUQ8rQCA9f15dSxTVo+kxMK22ac+b5XueELV4MiaNpXd6DSGsPRJMI3kJwmJAEhPR+pjhMfa7YaiCZZfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3CCm03wh2FGfryreJJTq55+viPxP666I5c/u+Eq5quctJfi2
	r70Znla5NC8YAhH3HFiOEqfMeaU5rVtGCeHcgz+b0Hzl7Yn9h1QJYD55jLjqwKSMepZ0twVfwY0
	pJNACJdSxtzpyFFD/8HHPhhYb0fVydrmumXZxKW2aBA==
X-Gm-Gg: ASbGncsivnb2U84FTgCqYA1eeOvU/ej3q3A6XILtu06WCAHC+8pQXQEqWwPwstwnkwy
	7usGJ4y5MUXCXrAYiWuL8eF1iYz1uWacC9cCM6ZZ4apXiL7nK+cDXYCV2lHGj0t2f885m6rjM+a
	bvmxV7lh1GpOYcCObqCBLpZ0qFoYTzVNJuVaEwIzjmr/i0V6ZqWmGj1pv7O9WxDYWHrOadJRLY/
	oSXCLzo+yz/pK/MJgkk09t7223eAMkQFWk8wmz23AydoicOwNtqZLLJvDR5Y07VwItM0Z4=
X-Google-Smtp-Source: AGHT+IHPuIKwxz1VJ5GILJ384/PXefNP+n3NPV2VlQgZ4nbetMc71L02vArjvfuIYkxo4JwTlS+BXfDTbbd4MfnOmfA=
X-Received: by 2002:a05:6512:6181:b0:594:48e6:26b8 with SMTP id
 2adb3069b0e04-597d3fea0cbmr771950e87.39.1764755698430; Wed, 03 Dec 2025
 01:54:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org> <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
In-Reply-To: <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Dec 2025 10:54:45 +0100
X-Gm-Features: AWmQ_bkoUmfhb8re1685S4T8kLpKSzEGo5JqBtrDagJzf8b9dtmfohMBjnGs5MY
Message-ID: <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 4:10=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips.=
com> wrote:

> It seems that multiple drivers currently depend on the CRTC being
> enabled and they implement the same atomic_commit_tail().
>
> Why not implement this in drm_atomic_helper_commit_tail_rpm() instead?
> Or why not use another common helper function for this?

So my v2 version of the patch series added a new special case
helper tail function to do that:
https://lore.kernel.org/dri-devel/20251118-mcde-drm-regression-v2-3-4fedf10=
b18f6@linaro.org/

It was politely NACKed for complicating the helpers library (short story).

It's part of the trail of how we got to this current patch series.

Yours,
Linus Walleij

