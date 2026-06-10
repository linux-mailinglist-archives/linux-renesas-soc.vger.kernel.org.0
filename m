Return-Path: <linux-renesas-soc+bounces-33830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kl2wJ4ORKWoQZwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:32:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B466B7F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:32:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=cpnejtQ6;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 916A53000B87
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 16:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F7230C157;
	Wed, 10 Jun 2026 16:20:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898542EC090
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 16:20:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108417; cv=none; b=KWGK9whSTUfyFqf0ywK9RYekht4iEhlqFwVo7vDVODSeZRj1nLfb5Cf9fdUsuzmQ/onIlgOrrVvfH69qF7lpOZO5gMPWUN4RZKs199GXqgPL7SBec40ZxK9TCMv/q5OEoS5zc1Bm2S4S9I/EqrnJfh0Dx5Y+Xuwvw+4+oPxVPcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108417; c=relaxed/simple;
	bh=s8wfvmKnT5EThbr+o6FwlV78PF2rGcjx4RuC4H0QgtQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sPA0JYiKdfgdPRgtGnvmE56EpRhKjrPeylJUC++Ts9BUOmmMfDjlPAmaM9Ltv7RltCvTxWmdLRgMkOHYQMl4icaKr3XHX+UQMTgQzdq5Sd6XNViUa55743vDPqajUqDRfoEK9BUytvJB+5d6J0ww3vDXgZtz43qXMEOGpQ25sg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cpnejtQ6; arc=none smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso36093e87.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 09:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781108415; x=1781713215; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca/qQ2yJUURFkQI8KWw8AjEcxJ3dgga4R9Q3zcxa4Yk=;
        b=cpnejtQ6Ag/jFo8etOQXl33qG4QIeAWIEqRjqu2fsv7HbuoSEp4lQ2LIT62iG2fQx2
         jqAnwsPHG9y67lXZlz5mN6nt+NKn32wYEEhpExLveAMi+63yRXPPyat8r17ql1yKAFdS
         NJ0cUKfsDcY8SLWt64wVEKDNbeey+McSlD1Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108415; x=1781713215;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca/qQ2yJUURFkQI8KWw8AjEcxJ3dgga4R9Q3zcxa4Yk=;
        b=eem6tdx7BYasDXyFBFNpB/Zc7QquaOARpytOUKydiYOif1GoSBZctDpiYXYeMoFx7n
         DkEe1a32pSIeYXICaiu6lnXYzclVWT0GvTF2h+VK/wBwTsSveuygKBR2iihs1wSL2t/r
         G6My7m9RN9vOTVREmjozvobf8cYh+uI8VrTHUs+laEFe6kByEAmCW8SvZfI7s98sgHKS
         SZxLBeCvT3A0VPs/WKU3DWqndJrPRwLXaDMHvZcRvKiTA9Y53nRUW6W6dc67MieekBMe
         1U98MiSVqXImNfkCIN/u9rH0xPB2yeYZIfqYA0PtfWayD7mTUFS7F3t2+bDCq8N50OJ1
         Awxw==
X-Forwarded-Encrypted: i=1; AFNElJ8srm2tFn2TFognPVz1I7xndqiSyarbpj06/6soqzF3VkEVaJV2kprV76xDEhCwiDPJ8Rms0vREk69Qr2v/bw0YRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrQPXHVHI0NF8Gve36KHmqJpmyoXWxIKWTazjVDbIr0RytbjKX
	BqSwwSNSUS4WSMaEEvcPzkPobVxzuOtzkJ9fxFDAIu5Ez7quX3okG5Esg+RIFdlm4w==
X-Gm-Gg: Acq92OGgB5Y0AjrB5wmwDtsGhoMF0jOj8rCZmrjum7UWVb7QjkhpsWCmJ1iH3D0EkKe
	Tcr2qUSSGMTU+nyPT5yGnVloC7XmM9ohoa8t6F7EBO8UoivwpFgIxBiuJ64cnkQAssI45ILYlH9
	gomGH0rvQpGQWS24H1ichdeGrb+4jwvt+LWL51ogNBcsx7RnsDD8iNhOSwG+XDGGThyOOmPIBK0
	JGklIXPkp1EdDblyTsOE2fgpUwNQYkrFDqqO0kJZ9Nba6ubrFx9hSFJQ0he2eDr9zGb1UQrE6XS
	2zO+w0/linOleb8qZI/aG6cJdRNnaH+XI/WDkJBSUO8/LR1yvXOX4pgLEzJMy1KmDesJSxz5D0X
	jXwaLjeyPmB4Co54M9Mq46dlYaQgap4cIeXmOHjGDAir0CgK+ok/On6c9h/xfICWC29HR0JUKbW
	S54ZUGEmszaONX/7ot3xl1g1mBbHM5ADSkAzTlKl6BF/1vgZ+oxVua6cYX83tjSd4C+2kbPwPIK
	iq0xSVEmGAIQT60zA==
X-Received: by 2002:a05:6512:6718:b0:5aa:6f46:83d8 with SMTP id 2adb3069b0e04-5aa8867d1d9mr5258791e87.11.1781108414772;
        Wed, 10 Jun 2026 09:20:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ee219sm5608915e87.15.2026.06.10.09.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:20:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Media-CI patches for kernel 7.2
Date: Wed, 10 Jun 2026 16:20:05 +0000
Message-Id: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWOKWoC/x3MQQqAIBBA0avErBtQQ5OuEi1Mp5pFFgoRiHdPW
 r7F/wUyJaYMU1cg0cOZr9gg+w784eJOyKEZlFBGGCnwpMAOPeOICoO2g14tkbIBWnIn2vj9d/N
 S6wd9Vyp+XgAAAA==
X-Change-ID: 20260610-media-ci-7-2-d5835b8ee28d
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, 
 Tarang Raval <tarang.raval@siliconsignals.io>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33830-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:ribalda@chromium.org,m:stable@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,cisco,huawei,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A0B466B7F5

This series fixes all the media-ci errors for the current linux-next.

They are pretty trivial, so it would be great if we could land them just
after we merge with -rc1, that way we do not need to add more things to
the allowlists.

I have added Fixes: tags for all of them, but feel free to remove them.

Hans, Mauro, please let me know if this is feasible.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: ov9282: Remove unused kerneldoc description
      media: rzg2l-cru: Remove unused kerneldoc description
      media: mc-entity: Add missing kerneldoc

 drivers/media/i2c/ov9282.c                           | 1 -
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
 include/media/media-entity.h                         | 1 +
 3 files changed, 1 insertion(+), 3 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260610-media-ci-7-2-d5835b8ee28d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


