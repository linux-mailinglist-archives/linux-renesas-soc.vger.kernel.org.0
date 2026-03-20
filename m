Return-Path: <linux-renesas-soc+bounces-30036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IvZKfy4vWnyAwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 22:15:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA5B2E1304
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 22:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A4683015EC8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 21:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F53E36AB4D;
	Fri, 20 Mar 2026 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="DG8cPD6U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE15368971;
	Fri, 20 Mar 2026 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041319; cv=pass; b=JDYF1M63prVknSY8nqjRaD4s6DTlWTH8krjeVtM5sCe/goh6ojzyCrtdmtgqz+nMDmVW2YhGlEUEoz4d3EzfvRum14dy5K8ytEW4USeCgw62j/hblTfhZMMIoWltmpFGIlBgBwjLbfJGD56MLwEriUuS7hLI6e3MrPwupYt6g8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041319; c=relaxed/simple;
	bh=lcZ2gdlyu2qY71EF5w2GJc9iEV6l70A/SyyaLnJUTi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3g+S4nxExi6o5B4lHMOheJrzs9NxridsPDu2EIbef9GCarAHEio5wkOS8IdzwaauoefgPRQr0lA2DQEg7FjlIUilBd22MKVC1etmEDrGSHoTqQM5MsHVPu4hm13crF1jJwfG93ju8/4cZZjsAcrK/OIz3Rfqnrm5CiNXVdF8No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=DG8cPD6U; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774041304; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RpLUrHXNOaN/bVWAPAlTZNRRsY4x15/3SGQgeYNjehHMhWILyS6BBmrHg01b3GTGzTExdZfLoX1IQiGIY5n/0uWtUKme6+O96z7pZ30j1wBRKN6yHVkXPJhxljp6j0NvYSpYeC0RycwqiawjK2HuFhNt2k51ZS8+aZUyCX0n/ys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774041304; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=avG9s+VWGe6FnFrQXLvOIIBYcVGJY4tuZn/WwXVVuZw=; 
	b=F0ZCoaPNFDy0u1oTglQzRkTlmBOZpHLxs+G1cchUhSr3aNaIC4dzik4JsOneThht1anfPsqF/2bIJPhwClVg2/bWqBJefcB3MVmcIXK5rXneFeqf1Nk3TuhZoUOSRa/Vt/BVHON3/Z4XAqY8aKDkxRRLGShpFzw2cirr6ybymf4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774041304;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=avG9s+VWGe6FnFrQXLvOIIBYcVGJY4tuZn/WwXVVuZw=;
	b=DG8cPD6Un5JPbI0l4/Jd0amDlahIM5F1dNVmECbYCPKV8YR4OMg/Gn3E2EihYpqZ
	lG1qW4oR+fK9UZucJRK00upEf4X5Zpl8Zgb8+H8J0cHFKXeBY4JgCTme3WRC8uFmsEm
	+3NbJ0ttiDzhDN5+LMcWj+p7MhmrQUAEdsyh68HQ=
Received: by mx.zohomail.com with SMTPS id 1774041302496462.7191544079375;
	Fri, 20 Mar 2026 14:15:02 -0700 (PDT)
Date: Fri, 20 Mar 2026 21:14:57 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Biju <biju.das.au@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC
Message-ID: <ab24yfzmP450taKO@sobremesa>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
 <20260320164158.487406-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320164158.487406-5-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30036-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.larumbe@collabora.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,bp.renesas.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,renesas.com:email]
X-Rspamd-Queue-Id: ABA5B2E1304
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 20.03.2026 16:41, Biju wrote:
From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SoC is embedded with Mali-G31 GPU system. Add GPU_PM_RT support as
it needs to be assert/deassert the reset during suspend/resume.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 711f5101aa04..3d0bdba2a474 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1156,6 +1156,7 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
+	{ .compatible = "renesas,r9a08g046-mali", .data = &default_pm_rt_data },
 	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
--
2.43.0


Adrian Larumbe

