Return-Path: <linux-renesas-soc+bounces-34563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GdraNRjKQ2oSiAoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 15:52:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC476E5114
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 15:52:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ksTm6rZZ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4AB3309A6C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 13:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53306381AF1;
	Tue, 30 Jun 2026 13:51:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB662FA0C4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 13:51:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827486; cv=none; b=X0SC7tn6zGLpnjJaKefpAQ9HxtVoRsJLxHiBJfeVTKJA4btAp+GXU2Ir+QwocsFJ6a3j2/gWr1LQwvxSlZpUzQXbG+IpWznTTzzohILYMEGZ614oy+D3X6FMbPHvhFuwikYC7g+myaf0F44mlWYkNJqpLilByLK9jqMu9Tgllx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827486; c=relaxed/simple;
	bh=owWcXuX/qDWhf3bfcIZlR8gZkg13brbN7l01uKf8gNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjapyN2VRbEETD3f92c1/L620iH0uoHjcMtp7Dgp0D8c1D69aQTlijufFs+jmvBSc8c4jgQnDj2bLskA7204RSq0G4cnkON4ngNYyqVOVn0psqDdVK7ppjxe9rHT9gcyrkYlozUp8oJV01mXbroyhYidioLdErF0PVLqOLs1baQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksTm6rZZ; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4759b4f0897so473070f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827483; x=1783432283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFQIeIkwS3eu7ULw75Po6E6kCVNEgzZ23LskSYDL12Q=;
        b=ksTm6rZZGDbaxVG2noWNvZ3GpTrPHpmq7iAuvFFN+eo/anxMUjgWA/1s+5j7zIIlut
         EcDviuOB7RjxQ+iFeTUS6SBe8n6v5iN2fsobUQu2ANLtJePUFXLaQCJ8DulzSQlnVR5b
         l1fsx+LOZ2Xt2/1oG4wVW+WFmtl9afABaQeXAhj634uPCv1Awy3sIpbxEoAsXCLTi/Y/
         iA3bz+WyrUAOq04CMeJfyTpQ1tN0ZW2r4vESAiV4wtkcCnr/eBdH8RFHyaTHae83Eb5P
         zkymOTsIiCODnghc4ITB+th1wieOd1sI33eCDoTdUvZpmIWAn9eTGqE8opVwgpoBqi/M
         AqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827483; x=1783432283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFQIeIkwS3eu7ULw75Po6E6kCVNEgzZ23LskSYDL12Q=;
        b=GJNdOkbHP3XTevyfx9S/Fu2XmSu2dhaYi8yCLBejcKAEG6ABc1i6ST4Q62zges/oWk
         vugRz7glHv/9ivuQfq7+KgfBskgy9rE6Xm49XH2JfsP0y0AJhSpG5wa44NrJ84xnunXZ
         HFvJN5/5vgWJ+OBQxWd0Vm7MQLzxvoObeirc5jRnOtX1wGHr+6XQFHmqxdH+QmrvG5Vu
         ltXwmYruSSyD3mEdj0CzlAgUNPdIUDDB18QBoX54Yy10BcDKyZNwcarmgBx4/WfrdAMP
         MsoWdD3pJxg7RO1HVLfX2wfCCCP5395bCzUdiJ2LxdZTUriEKoCiXqSsgs4DPT0+ciCQ
         Y2lA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4+nedY7lrij5zN9YJBHMfB3HmhfFjVh+ZGOS77pkAfa8jU0YSbdWubY8YrR0bM6CHKii/6o1Cy3qaenohImSFVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4RhPRcWJlGw8y/Dgo/+sauMWBwGIJgQBHOF7COo3L+F4+fsD2
	I6YhjPTE4fbO79Qxl+S49CVdvFT0NT1xsxFy37fqrLdyxHXdhzRGuyzV
X-Gm-Gg: AfdE7cl/BAZ7ZFxamIDouhclo0BGnSD/yk+suZzbWW8rd+y7dqbsqiXjRIq6u81yBxS
	RcFVTaCYH9lr5i5WgGAFMYjMUeBFmxIxnUXCpbASZgx/BPwWLn4ZR+h7kN0tJo1F/U658dfelQI
	+LP0hy1Rva/QAe0o4RS/m90OhA9YIHD+z29G96Sl+rbveA3VU44LIsqs3A2qZPVdgqatv9J87vb
	w0hbCONciot5vaOKwfIzZ6kC+F7WXQKS0l8u1Zh5mhFM6YupRIYf0xmCL/iFJplmRZgwGT8itGz
	ASUyTAUBVuse+M0mYBQfjY1Ih9Op+Ks5438wuXaKChFD7HCJ+IoLy7l8zN1Ol/rQskN1v7opuqW
	l1/t6SOuzmxFxh+FNdH99NoZlvNleMG/BOawvI30OdUNFET+DiJhFdF9jDGxVFrKzaGSdXdsDzI
	KrzpmXwXzz/K0OffnmjCz2HbBbtdp7kJqBToGv9w==
X-Received: by 2002:a05:6000:26c7:b0:475:e7f7:ef7b with SMTP id ffacd0b85a97d-475e7f7f3b5mr3210246f8f.1.1782827483232;
        Tue, 30 Jun 2026 06:51:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:3f6d:4f26:2d9c:ab4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm7216964f8f.19.2026.06.30.06.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:51:22 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tu Nguyen <tu.nguyen.xg@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/3] can: rcar_canfd: Fix dangling pointer on channel probe failure
Date: Tue, 30 Jun 2026 14:51:14 +0100
Message-ID: <20260630135119.104774-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630135119.104774-1-biju.das.jz@bp.renesas.com>
References: <20260630135119.104774-1-biju.das.jz@bp.renesas.com>
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34563-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mkl@pengutronix.de,m:mailhol@kernel.org,m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:tu.nguyen.xg@renesas.com,m:robh@kernel.org,m:ulrich.hecht+renesas@gmail.com,m:linux-can@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:ulrichhecht@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,sang-engineering.com,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,renesas.com,kernel.org,gmail.com,vger.kernel.org];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AC476E5114

From: Biju Das <biju.das.jz@bp.renesas.com>

In rcar_canfd_channel_probe(), the channel pointer is saved globally
via gpriv->ch[priv->channel] = priv. If register_candev() fails
shortly after, the error path uses free_candev(ndev) to release the
memory but leaves the pointer in the global array.

During teardown, rcar_canfd_probe() calls rcar_canfd_channel_remove()
for all channels in the mask. Since the dangling pointer still
evaluates to true, this will result in a use-after-free and double
free of the memory.

Clear gpriv->ch[priv->channel] in the failure path so the slot is
correctly seen as empty during teardown.

Fixes: dd3bd23eb438 ("can: rcar_canfd: Add Renesas R-Car CAN FD driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index fcc37b73ed43..57f1710caa89 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -1982,6 +1982,7 @@ static int rcar_canfd_channel_probe(struct rcar_canfd_global *gpriv, u32 ch,
 	netif_napi_del(&priv->napi);
 fail:
 	free_candev(ndev);
+	gpriv->ch[priv->channel] = NULL;
 	return err;
 }
 
-- 
2.43.0


