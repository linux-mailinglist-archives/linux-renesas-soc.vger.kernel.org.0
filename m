Return-Path: <linux-renesas-soc+bounces-32825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJqbC4yNDGokjAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:19:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2758226C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B90830E8C08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE31400DF0;
	Tue, 19 May 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmBmIf9l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA28E408028
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206927; cv=none; b=ODlCoAsPpckEiP0+QqXj9cCq/lYkC+4lJvrqcsK/baSE6ss6F4umDxOAXLASpQdukB1gXgSpaq38STJmo9+osA1COI+yUyvHmRErzzlRDIHdBYaro/TkjUM+7zybKit6v52xYthkTYKF88sPPPOJ+FIM7q+FS533VkFxOTC84Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206927; c=relaxed/simple;
	bh=bXwOZVfZPbv9p2fk7F7+mYAIFUci3SJVGmVm74QM+E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCCyWbrBeSCbTWv7lBMVgxLYRDC1a2OlLsPAkne6mahz2Tf1HVplD3NEeBhE1IiZzK0Ob72ofPWi8mgntFFUiLe0R2Tsm8bNtmSjJVy+WHxXnJOU5MIS6V11ueGFQSsSogfUYgRgicnQ0VenWBwjga7e9rG/iNRmRg0V2YCe3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmBmIf9l; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso31185525e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206924; x=1779811724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+Mm35+gyRUpU/UbhRPzGueGup/98gF+lABSNhHuAq0=;
        b=BmBmIf9lLkK3QHu2DL9GovQBijYpe8AkCe6fWY1DZCM/Gu1eAmFxtqerQ6W2SXG/H1
         Mm5ODHyakrIYD0AL0g5pQJXTCeh4BW93lv+BqLLrSQ+Z+gj3ErA4cfIuP8192WtNkcFE
         mcKl8njr9EA105NLO3RszQmJRc1lQr9I+hvcQyMIt1qEMxyW5h8zjnGSOoHnk/g5YbI6
         A9DQqjHMz/wtFvdOiiVV4JS97NEzrYJBW73Bx255yA+p4Qgk8kCiTT41AdwAobFNB3Pg
         7yUoiKkpt69Fw7ncXemTO6kzznuMkKfwLQkrY1bJwYS1TAeMA9XKIpbMb/6fqgBnpCPO
         p6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206924; x=1779811724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9+Mm35+gyRUpU/UbhRPzGueGup/98gF+lABSNhHuAq0=;
        b=bco0gebegIphrxJ+GP5NixMOHdVOnCb20Sxd/AklNQe8y+xFom95/zx2T5Cfn/At1K
         dN+vYekeEtL78t6D0d5dKgs4RpYjxBKObWUwy9DHWslOdNZgI1A6dDOopqYCmhKKkgJ0
         VychgJyPgCVVGIzviZZDF+H7wG/07xQHwWfP3gUb4pasGGucWmkS7YaJF6HY1reS4NiV
         Gtfq2TVGZnhyPvrynMFHXsTCts1C/lHyljFqLs/wFHS4iLzZQKAGHTrMTOMixGsH5GcL
         lF9QNWduojer0mThqrK+kmaBhM+njIPuftmrvq2ZfucyK0DKG523m94MeIRPE3QrxQwQ
         Uupw==
X-Forwarded-Encrypted: i=1; AFNElJ9sDqh1v8kaEGWsKGkxzhxuzBVM256KGj+kFboRZsR4BwRtljh6ESF/AZlGAseAvkaexf426qvUfaH4is3Yma0LJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxvLFLjOEbzUa0wywceP8JcU986w6UkPC+Vc5nwCMGR7zYgkqV
	8srsUc8yDYfXUIjuTkyQ7ezXK71i7Pid11MHynWzcYmcKIkPj25HbbN1
X-Gm-Gg: Acq92OHenWwRBl2vnXfNrC3IENMDHoMV6EWQUt0IAAg193xktpphTlslxuaQ5ssvdKn
	VyLNSruw7eUotT8c/ZCoHk/I8G2celt4YgSCI48VxQPyZkxZekha8rszlA3UX+62XuIXrhjSpmH
	ZgvGEd9pZvjHM0/3eAKHpou8XXKVGTxAiYcewFvb+nSwIz2svJ/Uz0eusJ0Q0sU68Z+vT4FqiIB
	QpG3cqZrlA5u8RMe8RggPFAJ+6qe7yGBjyBMNVgRDFyu64Pj/1CP3MHFBs4pRqf7QkSOEELUnKw
	eWDIkUmKYNFk03TEWsdJpM333rBvMjZ73kcNb/eWed7rKGjBqd/SoKd9ffwd5A1Px4mhcmi+DLi
	bo1h0e35hBixlRUaxz93wjwm4E7HfW2XR9STkZR0g+5bKEnoLtu1oZqFwI1xhmkFRZxASntOwwn
	tduN2WXsh3D6KXNDmPZVMnk66fssKdPYxVKmWR03a8FYgOjjYqOCZRF+vcyJw2u48KSJxYhYEGf
	plxyxbFiyB3D8SLauwCsuPE4SjFeBPbe8ygFA==
X-Received: by 2002:a05:600c:4e47:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48fe61ed3b3mr335858345e9.16.1779206923936;
        Tue, 19 May 2026 09:08:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/5] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
Date: Tue, 19 May 2026 17:08:21 +0100
Message-ID: <20260519160825.4082566-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32825-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,0.0.0.1:email,0.0.0.0:email,ideasonboard.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 9AB2758226C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
port@1 in the ports node.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added Acked-by tag from Rob.

v3:
- Was orignally part of separate series [0]
[0] https://lore.kernel.org/all/d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com/
---
 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..5add3b832eab 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -102,6 +102,7 @@ allOf:
           properties:
             port@0:
               description: DPI
+            port@1: false
 
           required:
             - port@0
-- 
2.54.0


