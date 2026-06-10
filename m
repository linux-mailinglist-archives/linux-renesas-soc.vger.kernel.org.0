Return-Path: <linux-renesas-soc+bounces-33833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mOTiHvuQKWrbZgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:29:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFB866B7AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=OBZlAUYL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DD0B3197FBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 16:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B1033FE15;
	Wed, 10 Jun 2026 16:20:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C9C32C937
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 16:20:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108421; cv=none; b=I1sj76B2uk/x2GzI+JB9alFdqz5i19P7FsQlhGgflmeOEAj86N/cjCdiuNiXVP2BzAUOUvoT7F2xvhId9n3li3MFOG1bpY/3YvIWKWnr8SB5/zlTcZubgb6AcKzkHNtXEIqEyatVAGCpQ5K/ldcZKLFIfbapR3GL32XQOmXRwrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108421; c=relaxed/simple;
	bh=vhvliuSK1Y4bcVaFJfaU5ZlL8b16yAONPz3jtr28TlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWI22o+AGmwFD95uTqR3f/CZwVN28rvPZWCdhbZRUYSpaSAfNRvRoWn0OKm5FOq5NiWpY+4t5KNC30NAfBu4xven1AoCqoDjU7Tx9fezOsN2Jlrmgc7B5jIW6OS92Wt78nYDh8Cx+f30eCPqR0PoMr1WPokSLXSg/BOuTP/+jbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OBZlAUYL; arc=none smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso7200268e87.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781108418; x=1781713218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIpz8busIlOEDCfvwpo8ALDZD6urDsuiDCPXRpA/AkA=;
        b=OBZlAUYL/bjPamKi6VyLKSJgzLsMmiPirjMCOh99vAhqcigu3cNgv84ogPwPHQlWuX
         Fa+hFgp10d9q+6ZXtd2NdEi+7Kuz13R9pg+k5qqFwKWPh0bC53VY3ey+JVVoBNTHP0ww
         iTk1MjbzsbnAsYCg1d60dzIAn0fObp7swnfO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108418; x=1781713218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PIpz8busIlOEDCfvwpo8ALDZD6urDsuiDCPXRpA/AkA=;
        b=WmwvaumSTZREtUjhMBDJmw68rGFe6SOY2X5aIWxy6bkWHR04JbIA6OTOJTZouhllB7
         RpBQ+BUgvq57uP/4qHCKv+eizhkxMPgo9AAskFaHVlEXkpXeyeTkvmgSojCqvzWD+pIj
         09AvKtTViaQCg5x1vstXLmJKxVkqVYVC7vlI4xohnhMs+od/YLumPyJDjDHVyjDKrRrF
         +GrddaNIwbzQPeiAKL76W106msycj8Nou7rYfIAUSdaCyFHI+YErisjaNMMa6lhH7pPJ
         xOdsLLqfylY+BD308tCy7wrFr0+g6ulk0fSyX1Svwd/d7Nur5caNt9XmT4TMj9oJ1pSo
         d3Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+eJnPvuprroHziDFnZ6ULf/wHIBTz2uBlZMUTFhI+Dz2ArgGS2HkpWflrariUPDUcDEaUy/fRQHdNW3NXBUWQcYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYss2ghZ2B5OWauuPyPnbIta0yfJdDWn1X7nefRuQCL5uB+eu3
	lXE0ZNNzxP+KCcqbZO247hdwIa3z8ZQgiu36i1JnIw5/G/bmq3FAToeGPHaeUedMsg==
X-Gm-Gg: Acq92OHFbBcUrFcjsFj7FSWZjaPnvXSh6wVfHqmd6kGou2ofYGwN3c8X3F7kMir6hkD
	p+fifCXKWTvjRPXxvEh/oL8avs1WHVdED/m0H94s8F4y+s4IuZAojjf7PAi6b6hS4YJ5yWFbjvl
	ZO4YDZS0EYVj4u97eS4kDARq+L6cqV1qGt824dhwe5IiyEiCjwPnPH6CnRzmdvPb+LrIGxSQvjv
	DULwIbuAGGtU9GKjaTy+gECvUQ2mBTVnH33FD8AmSlDSgKor2EBNeaYwSv8kNTSULy68GFGBynl
	d/6A8tVAh2yBOCO/VGheZkbRKuaMWRhprTW9yBwxuoixYaAA6c3QtOheIlkrCmU1dEOzwb5111M
	gVESAKI/4IbcAgRkL3oQnmsK2R8++lGubFjCbo4XgiCrVEheVvat1X24yjcoIsmBXD+m0HPkJ9e
	PfrSc6yLFQKIvQoW6boO2ZuGvu2X+9LRbmiLQ8MmaXlLyAPBDckDDsSaz+u5giLkKZrwwjv5rey
	KO5LH3JqS41CoCuxOGVbCpUYtXF
X-Received: by 2002:a05:6512:4045:10b0:5aa:780b:f341 with SMTP id 2adb3069b0e04-5aa87c0bacemr5058825e87.35.1781108417762;
        Wed, 10 Jun 2026 09:20:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ee219sm5608915e87.15.2026.06.10.09.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:20:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Jun 2026 16:20:08 +0000
Subject: [PATCH 3/3] media: mc-entity: Add missing kerneldoc
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-media-ci-7-2-v1-3-3c61a482a44e@chromium.org>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
In-Reply-To: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33833-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:ribalda@chromium.org,m:stable@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBFB866B7AE

The argument args is not documented, and the latest kernel version
complains about that.

This fixes the following warning:
Warning: include/media/media-entity.h:1394 function parameter 'args'
not described in 'media_entity_call'

Cc: stable@kernel.org
Fixes: 48a7c4bac94d ("[media] docs-rst: improve the kAPI documentation for the mediactl")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/media-entity.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index d9b72cd87d52..fa393e840669 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1387,6 +1387,7 @@ void media_remove_intf_links(struct media_interface *intf);
  * @entity: entity where the @operation will be called
  * @operation: type of the operation. Should be the name of a member of
  *	struct &media_entity_operations.
+ * @args: arguments for the operation.
  *
  * This helper function will check if @operation is not %NULL. On such case,
  * it will issue a call to @operation\(@entity, @args\).

-- 
2.54.0.1099.g489fc7bff1-goog


