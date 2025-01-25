Return-Path: <linux-renesas-soc+bounces-12504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B124A1C4C1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 19:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E8B8164B09
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 18:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1995B667;
	Sat, 25 Jan 2025 18:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fAuP3n5k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC481800
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737828269; cv=none; b=D38FbBfAT5oNUQtL00oO8qqq3ohZflYo3eaLKuAgLbvRzv1Hu0IGPkRdHuapjpCF9ziLciyQOEXzHFRm69dy0294GflxWlfDlb7uWJkgdEuT2nhxxKtcV1T3ZjrN1lxQeG7c18Yt8KciEd1MSyFilI3E66qZ4xKQtEcTZ5Iz8VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737828269; c=relaxed/simple;
	bh=QNhXxzNxfdAS0irgVoFEQ6zXcOCkpgvsAxJzM/DjmIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDDrJIljK7zRRw6tHtSbJOYURhfkaMK2p+bSvhX/XZ+lTpGZE10r2nvIEyY1sRMCnld2niwjODgmcmHfuxKA2YtlyHX7rsEjqgDRurKxpewmJvEaaiim/gFdn6drVnflDO5AdHnr4iNMD3Vm8q/zy0y9FcFvmGDbWXVUee1UFL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fAuP3n5k; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so2971887e87.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 10:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828266; x=1738433066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dzSy8liY2gyXwBlcvSnsmfhSO4F0Z9sutNJNIuQmsZE=;
        b=fAuP3n5kB8Gbf15T2MGXRppoUUOeiyVCcNWH/hqDvir7g3Obo4fomyvJRhlJfS0aZq
         87k01b7uQu+S0mPaXAI2Hm3NwOut4h5B8jQNsyQe9M915MfC9+Y/fpWRclzyYhDs/voT
         ULYrdgZM+7wZJ6V2l8t3rFwUjo73En2s7sln+8t9Hk8En5L4G6C7scsKXddMN09nv8z/
         9Sak4UvmEqLo7k9VyIrM/0eyM6+aAphch+byMSIhpdFS1iYgXSlwBRvptZjufOMJ1ueb
         fjNvUrQ1dOu0oRuUGM0hwoCaUVMIYB+WEQdFfz9+bd+/w6VZ/k9fHRAUONIZ9dXnE+O1
         2PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828266; x=1738433066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzSy8liY2gyXwBlcvSnsmfhSO4F0Z9sutNJNIuQmsZE=;
        b=xR1tmcbIxkBActaG/YzJG1cU8EYHFT3QVMsK9WfaRBtCxFfCxILu3isknMbVx8FBkC
         cojh5qMVn7t5AApR2sqPGJai11gdChCR9a+LwbfJ7Z1TPoqKW+mmxJlT7DK/N3SHQiwM
         Y3A4/wNS/Ir2W8CRWp8Dlldyht1RzauyGVLLHyEoF2ybOQEJKATpEzd3JQcPWEvqq9cm
         TtuBwmSHoA+E+NnzublYcypbdv6neE4N6DFbNwQrs9r/rMYd+IK5T9cka7oeGGQq6qnN
         tbKncUgpfAjiuC31tYNzLfHSlM6t75wk9J4NqlVOin5cK9EQP/eHb3bJ2PziFdws+zlx
         QvIw==
X-Gm-Message-State: AOJu0Yz3cYpUlbzf1O0jYTrHp+6nFOqnY3fXTdeVZlQ5OpkaRC4Evgw3
	kifvaRkQj2O1QHerdrgFPGbzqCgywSZkxZIW2wFHlknDjaP4dxSbqhUmt2O+CvU=
X-Gm-Gg: ASbGncsscnTZMLIUUxkuKLNZZ3VuZR74tX8QKwUPZQjxhee7GXGVASmG1/3X/3Kh1b2
	OJL2OPFjBExXrGTkVbhxL/atrjOD2Ld6ibU29t4OaUD4I9PHDUF8w5xoeLdC1fJIi4BNXjGL3va
	orAYHJvvVaSDeTJpJYlrx8Sqc2QF2wXV8IgYebsxOhSqo6a+b3LGcxQpmYQE9Hl6FXARqyDk/AZ
	EIws4X36R21sccZvXao/j5mZY+jLxbc3avxppDZ4BBeGdmwUHP3tDO9UoQTfbDk4+bRPiGRYawU
	ZyXp7BmROT2raRn3ads2ifeSLDL8q1DsGrBUBn68v23d/OZJFYbUSj3HRRwJ
X-Google-Smtp-Source: AGHT+IFqlsioC2N8eIrYR1B/g5ir+0aDTpIBc6L7li4LyPvhrRta6EbanbGoI3JmULDWOPYh7BuYSA==
X-Received: by 2002:ac2:5d6e:0:b0:542:2972:4e59 with SMTP id 2adb3069b0e04-5439c249f21mr11068203e87.28.1737828265991;
        Sat, 25 Jan 2025 10:04:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836830asm669436e87.139.2025.01.25.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:04:24 -0800 (PST)
Date: Sat, 25 Jan 2025 20:04:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Message-ID: <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>

On Sat, Jan 25, 2025 at 01:53:20PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling in drm bridge drivers. I don't have the
> hardware, so I hope I can find people willing to test here. Build bots
> are happy. And for it6505, it even fixes a problem. See the patch
> description there.
> 
> Looking forward to comments.
> 
> Wolfram Sang (2):
>   drm/bridge: it6505: Use per-client debugfs entry
>   drm/bridge: ti-sn65dsi86: Use per-client debugfs entry

I'd say, it should be done in a slightly different way: bridges have the
debugfs_init() callback, which is used by drm_bridge_connector (and can
be used by other bridge-created connetors) in order to create per-bridge
debugfs data. Please consider using it to create per-bridge debugfs data.

Note, that callbacks gets connector's dentry as an argument, so bridges
still should probably create a subdir for their own stuff.

-- 
With best wishes
Dmitry

