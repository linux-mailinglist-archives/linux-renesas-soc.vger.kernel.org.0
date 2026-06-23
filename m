Return-Path: <linux-renesas-soc+bounces-34376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /GJLLKOyOmrWEAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 18:21:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA866B8B02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 18:21:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Hb/xaqsO";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C484E3065BCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 16:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FE430C172;
	Tue, 23 Jun 2026 16:20:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF84E30DEDD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 16:20:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231646; cv=none; b=cdNDHtYD59uaCtQzhe4xJ139Wi78QSO/RoLoTbdCinu5ysI2TWiTVC3iDIQTVwZjqSrPogAGj0G+bywVifdZUZpgFh97hs7KAZkb+bFO3OXRKBDKoGOsnrozJ1oc3svJyw0FUWyWrd1hRGf/gJq7YRyhTz3uts/hQQYNphfb1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231646; c=relaxed/simple;
	bh=GB0v1r56p2oKIDWODMeWfe2Saf0feOje1AnHCDa5egc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UEqvQPIL3DSbnyByEZwtbDrUaccIhYJtsKGesmbgiO1mCNJjzltxbNThHvzaGDDWnoAW+HZuB8bNOGolYeIpXMiEzdAP437Em9cIbJ9U3tlOtMbAsGFSQrZ7pN4ZZBaRWBQ2bCSIGKnRTIRdINPPOWm0pUJlLqRCN+Br4K2mhAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb/xaqsO; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso1089645e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782231642; x=1782836442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6zsFhyNg4v20o6k8uh0sFiRqoOz/yr/BnKKUxkYNu8=;
        b=Hb/xaqsOYWh00j+By+dzIeD1W39JXmnFX3rygPSF4rkYGobjv3cj7tUjEJcdbGhdaW
         V0TkZPtwXyk8h2WtZbLn158jGAeCb1QNvaPemTxjanJtWM+BSU98lj7aLyEN2AZMEKkl
         hgUARZgbqVXC4vFI3q6FL/ZxeOxX+67EGAlEYmRmJEqQUMD/bObqNy3dO5tJfnjixDcJ
         YCuF/NPZc2lToyBqm+H347cwtfEmWIiwr/i9DrpvuTRVpAQl5SRljeKEN0Qf4yQ/qKyv
         2p6UdMhRlqGRSrW4bsZdqMXRPsr7eS3SfeNWeSJLisKSPjCk4N5JuyF+RjnBoYi3yefQ
         WsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231642; x=1782836442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6zsFhyNg4v20o6k8uh0sFiRqoOz/yr/BnKKUxkYNu8=;
        b=ApgEiXIEcg9hu7Ycchguk2whMR/jstptgsW/XzRwYwrsdhWfOSAAL8FjSNIqjap9m/
         uYprzK4UtD6lY4VND9HE8W3++owvzuWM7Rdl8dY6o7CH3J4+PKfbFAPfl5giT17qdnfW
         rcy7vmHHNurYZ9QWCueQi00iq3Q0dmVIsgQYOdwtqaYBqOs+ibLnFnL8X0zC17dKeLBH
         vZjHV3EwsN6dhlCow0vdEvpfr693TcjDL0VEADsqxMHrQX69T0OnjrEnb7Dc4BfETVA2
         jjb108ocwckkSo8ds020EMllYnhW1Ta0pnWfQHlteR5+v9yQ9E+U60bTIRm0iy2GLAnz
         Ywsg==
X-Forwarded-Encrypted: i=1; AFNElJ/aKQlupCDrsADNipowlDPEUoXJqHWPG0ghw/IVKSmAu1F/bO/uyseTy4d5cTfWxf0SBMVS21zRNA4Fqs65jtBJHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1owexPK+re+XbRIDlvX6uZ8mtIfxeOIkXirk8/Fgg0xVuyYG
	rATQ7T7Smro+bQ71jtMQK2gD/gd3R1DKKlrtizP4/GOz+egtf7N3whSI
X-Gm-Gg: AfdE7cmxKsFVs7aZdJ5RN+Y+ERkGmjnEuKJSetyBQg6doUUFwdhkfem7DSfqYb4J0AW
	NYO8iYhQJxSI8BPGpsKJkY7zTOfbr+H3HUu12E/EuFjmv/rrRGvkNO2BezcQ8bhULAon9xL43F/
	iqgqCvQ1I19zTyHpu5SsxxK39hC52Z0aKeQOyq0OecHRmscbFy1Xr4rl0ePS677vZSq0gvYmRDI
	qzFRJGF5Jn1eTV5jNY0UJcvi9Iq99nzCF/p1I4IRXtFnJ4eLt6wisyTOd58IduSy+Pwqqf3kRjn
	RupHR3GuhGB+0LGKPTqChxXNC+BOFY9XapprbGs2pmt+D+7IrhEhhr0isGTrX6rnhYON1CTGNbO
	0vOcX4XmPopHAVbbYolmbKz8VIf09LFCESdJwRjRVMT28qsjplazJ7tOY9V5wrRnEQ+sx5aJ4np
	dxdovdXOn+bU8j+JLbKL2U2mDcEPKQH8xV34dk
X-Received: by 2002:a05:600c:4504:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-4925b35d6camr50930705e9.15.1782231642037;
        Tue, 23 Jun 2026 09:20:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:866b:1811:6889:f05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923914fsm315495185e9.6.2026.06.23.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:20:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
Date: Tue, 23 Jun 2026 17:20:37 +0100
Message-ID: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34376-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:alexander.helms.jy@renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,renesas.com,baylibre.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AA866B8B02

From: Biju Das <biju.das.jz@bp.renesas.com>

Alex's email is bouncing. Update the maintainers list with my contact
details to take over the schema maintenance.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref [1]
[1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
---
 .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
index b339f1f9f072..990d287d0a90 100644
--- a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Renesas Versaclock7 Programmable Clock
 
 maintainers:
-  - Alex Helms <alexander.helms.jy@renesas.com>
+  - Biju Das <biju.das.jz@bp.renesas.com>
 
 description: |
   Renesas Versaclock7 is a family of configurable clock generator and
-- 
2.43.0


