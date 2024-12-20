Return-Path: <linux-renesas-soc+bounces-11595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617429F89CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 02:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE622164159
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 01:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2056823774;
	Fri, 20 Dec 2024 01:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JFP5gzNb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488C23741
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 01:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734659830; cv=none; b=hiDgcJsOPhdPBMD54fLzNS79Ao3bOYCn55idIqVDMk6Vkxfqxgbp9XCKghsTk+PQunnLep7uUqVyomBvAtdCA6oWvsJOqXXtSjpRsRDH53H8JEQzv+kEvnqH4Gx81gvypKPE6YtY1pWlDwBWjWCUtKRmvdDW9x+BlFSUUy0NZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734659830; c=relaxed/simple;
	bh=Pa33uNGDveCTGWPmZlK+pHk4ZCzO3SK5xDu7g8EhurE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WPlm38QaYbs17q4OXHpkCbqnaExdeocXfoDyrB+naR/86iJ5eXG7rw6lwPX0B6unwDLO017r1HqHxqoHyKQ29bfin6jYeCeLcE8UmZebo8mdVpLR9QG0vEO9Cfsa4a885qawRPfGZ8ETJ1ovTaga15NVzAxBBjKMhJVdxVBvD38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JFP5gzNb; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-300392cc4caso15637301fa.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 17:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734659826; x=1735264626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcxbyvJiOICQMcEs6u323lixswetago60n1o/AkURyE=;
        b=JFP5gzNb24KBkmYk0wjIE5cUTRndc/bcKffcv+00eE+3JjKr7nH/oQao6ZytUNoaM2
         +68055dgykzU82GoC6rN4cY2MOxIQ7/h9VhQGErr3oibVrwe0cXdwJuCArTen84YMaal
         Pe8V1nO90h6Sa8VSa+mcBU3ePU5rE5UHHTTes4Fyg4OMeLAkXEwQ3q69FYac8saEiztu
         imIjOufksU+DwyZO5LtOlDwaWHz+PAM9LqEFo3JE3/UhZ4Au+Dv7KJxnOysr/nQsFX2h
         risyxlEcIA8LUIqzi28uxXYKbZNKuD/5sa5xDZC+lq6bqcbxjhL79IjVwXbMsQ+u9TVG
         NEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734659826; x=1735264626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcxbyvJiOICQMcEs6u323lixswetago60n1o/AkURyE=;
        b=ofkKt0iHpdAcqvdpSBUDSjGjLaq2Ka27toBL1FD6RT1u2rNTGMxfVhctWrylH3hGrk
         zkP8PzFKE3bWhG/AcEHFqcYGe4mcC9M7EZ23wPfiHFKZdcdUpYWiemd9gDeRunz6y5cl
         6HnPllYn0259TnKdI7msK/0A9DtgZPNc67Xj7IxkKALWY9JjRzrT3Ig6NUCAAl6UlVaE
         WYttOobjh+dCZCmJ9O8/kRtb2ErFW47NPBSQb7Iwt/5jq5n6Pg3zhvBbkDJVBGg4wkSi
         U4WGNKCoztytEgbbWUqgBj3ee8A9MkgsGNpAMIjeIlSKqYfjOpbW2y8xmWHaBuB5ouDR
         q4VA==
X-Forwarded-Encrypted: i=1; AJvYcCV0375UELspEbj4itWy0v8owsK+0nfMmLMNy6cy5D5CAcp+B4c4roQkCDwgSDoSRYNm5BOpvn9v/w8xP8Fwt6zIpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8pkSKeh4uTLALjjyhi1ip4GgadaiSNbKPm66TQHk2r7QiOtoN
	n5CM7XxoyYOp82Qnjn1NtWCewsdea/61VNkTuyHE4MGE00+a2Lj6GXFqSWLP8tBS1srozlll7Bl
	F
X-Gm-Gg: ASbGncsXmiCGHJBfmGPwG5MZVwJ4tR4j1dUJ8ZHCPefoOxdPv/qgA6eUG1AExwQ3Ht4
	oHY0U0gkg/laYs50w2b0UKUcHlDl7I9BRHjJ7857zddInZJeUfn1U62iwFCwCyFJKWUjC9tEOuD
	wtCUZQfbfm36NFkOoW8lqps2r6vnabQkEBrw7epUS/W74X6H2OpKqmxA1jnAX21P7oxhGm6Y9C8
	GX53YxX85Vstg61Jp2S7xCKQPvbriPjWGUwmq285A6df7d4yQ+/nEyKnsN60QiToCmeaN6vUEwi
	9UGOR/NF8U6jT5PN7Lnx9Ey0
X-Google-Smtp-Source: AGHT+IEGdAy9vvO//82CPUOr7vqwKuGjOfLCWN8ZKc4QKX1xqUxp3Bufx4tMUvT+ylCqU4OH7XIPFg==
X-Received: by 2002:a2e:a544:0:b0:302:215f:94f3 with SMTP id 38308e7fff4ca-304685198f9mr3524541fa.9.1734659826258;
        Thu, 19 Dec 2024 17:57:06 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238214eesm328324e87.190.2024.12.19.17.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:57:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 0/3] drm: adv7511: ADV7535 fixes
Date: Fri, 20 Dec 2024 03:57:02 +0200
Message-ID: <173465975414.3473111.11308790514573278508.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
References: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 19 Nov 2024 19:20:28 +0000, Biju Das wrote:
> This patch series aims to fix 2 bugs in the ADV7535 driver
> 
> 1) use-after-free bug in adv7533_attach_dsi()
> 2) Drop unsupported single lane.
> 
> Changes in v7:
>  - Dropped check for host_node as of_node_put() is a no-op when called
>    with a NULL pointer.
>  - Added Rb tag from Laurent for patch#1.
> Changes in v6:
>  - Fixed memory leak by adding goto stattement in error path of
>    adv7511_init_regulators().
>  - Added Rb tag from Adam for patch#3.
> Changes in v5:
>  - Updated commit description for patch#1.
>  - restored host_node in struct adv7511.
>  - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
>    in error path of probe() and also in the remove().
> Changes in v4:
>  - Updated commit description for patch#1.
>  - Dropped host_node from struct adv7511 and instead used a local pointer
>    in probe(). Also freeing of host_node pointer after use is done in
>    probe().
>  - Added link to ADV7533 data sheet.
>  - Collected tags
> Changes in v3:
>  - Replace __free construct with readable of_node_put().
>  - Dropped single lane support from bindings and driver.
> changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped invalid Mail address Archit Taneja <architt@codeaurora.org>.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/3] drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
      commit: 81adbd3ff21c1182e06aa02c6be0bfd9ea02d8e8
[2/3] dt-bindings: display: adi,adv7533: Drop single lane support
      commit: ee8f9ed57a397605434caeef351bafa3ec4dfdd4
[3/3] drm: adv7511: Drop dsi single lane support
      commit: 79d67c499c3f886202a40c5cb27e747e4fa4d738

Best regards,
-- 
With best wishes
Dmitry


