Return-Path: <linux-renesas-soc+bounces-30601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KoDAyiSymma+AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:09:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF535D7EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 994333012599
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7124B339853;
	Mon, 30 Mar 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJHRFUKy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B93385B6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883219; cv=none; b=gCiV+DAdpaI82vVGyesR/MrBLp7oH/DvClQKx0oPjy0/nZBB3lzYpgN+A//HsCbkfVL7tzRX8OqJ+n/PZjEj20UNhtL9BcQ0uwfNzoLTFF4HAGzzQmHbcYKBjN+/qUdxiqkVEZvBdD+KlGQinRoQ3luPMTWq+TV8Xog7pcC+F8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883219; c=relaxed/simple;
	bh=p+eWhg50WegLSEXAF6Nxv3eUiQbrMEZ4FanIPXGKwZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U56/uDNo2v8+m0ZJWXRnh3RIp+WiqZspCYH0EKMAZTMqGbnt4ZjsEq6tzVoApoIOUSkpAcj9gbR6HqRhQDETkWOCFv8BhR6wkrQ2nvl5A04xeeml+ILhQsEcgAtkQOzEXHH3fu46ZO8U6nbTMrWoBsVOMfzgwzY7trCAG+OqDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJHRFUKy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so45943155e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774883216; x=1775488016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t10t7d90tvq1oIUR8H7YoceRX84rV+qS4jxtEp+R5O8=;
        b=IJHRFUKyzshU2gUyrxRM20SSsI8UtUedE97lr6jh6az9lwvjGXBo1EhLe5bN26SJGJ
         tJxB7cP9Heel4JdQVbPDyzFEQ0PJOENaTOLPnj34Wh0NzMhWz0CZ2oZD/XgGueeokU2o
         TYDYeStYwoIai25A8L7RS42HLEwKbpNTsGlBnVJdFxm5Ne2YixXqSC55uv+K8ZdVyLcO
         z+2wP3RgaeL9l4jQWZuzLWOoBDSPie/OKAwsQpt11rB03MhZ5LZHNG9e6psBaZWRQLh4
         wabhVa7LCph0acUurO6T0YhA/kPz1jrIAjjIn3crihUu8/5to0xSQ7cMFsKWD5qMBTxX
         RWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883216; x=1775488016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t10t7d90tvq1oIUR8H7YoceRX84rV+qS4jxtEp+R5O8=;
        b=IzbkKiHgqzakmZ5QohP3HN8qTNfERZluB88Vh52DKRYTgjzhwc+gdSIAvgxmFqQ1Bo
         g4CjAqzPbjIgS2ovPRSaGVxME7UdJbdDZemBuHTwNFSJAGULWEG4P5VSkDa7crR+8hY+
         ciSDk0r9d2mKj9wm64sEOrWUoOPQEhlG76wMmYvgupMDnW2eC5JRl86RZTaJTT7G4IHt
         e1E0pIkJhOevdvQP+Wu0cP14pNTp1HKJrgg4PCm73uuXqWa62MNJJPSJiaJAXppV6RsP
         nJCLcQc87NR2hSY203xCw1/MsQMXLaWSrhW3sVIscE8fwx7n3Cuu0lGr3r+RnQbz+Kdi
         Ec2A==
X-Forwarded-Encrypted: i=1; AJvYcCXTnXerml6kP0b7nRi4byvikQhe0W6aPTmplurNHzuzugHQriCiiLsFSqOkrkX9eJHLcoJih4b0xYjheZDB9QVM4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ujXChS0tglAm510zUMnrDJ+3I+RGlCM/OR7K14egRswxwVeG
	TATZpMZ0DJ40jn5xsX9cHQ/ttYpaAAXbRL06IsBPSWPgXl+9B/3Spao/
X-Gm-Gg: ATEYQzzNTeutS7grhetFiD/WMINY94XgO0aYx4iDLwVAPaGqSiE1cf0JQqSZMi7V+YL
	ZwZ+OvHqgpbaAOZR4dtnCIzfghEfE76cxZObD22JpNSHtZvgOVjroQa0Wvi6n2DjvhPgfAokUhQ
	2ErIJ6UdCdpCi6+Awl7QYjjpyO5m8OQaphgSkmqk74cZcDQ2JIEXhY/Ob6T1SgUfe1Ta7oMFaa2
	3Cv1mmcR76bohzV98XBrKhi445q4WpEEEJxn1XYB9skkHZXZs8/I29sExUN7K1QXO46NneRhq4B
	uNP4HEdXuMg8Apy9FhEyHLSQ7vOZAUIxDTVsWkGUITXB9FEF77ryWKVtcUi7YGZDI4wryvTAZIk
	ljjqgXD2ppylBTWieAoGo3RTrkgjJyhm7t3wMaP/ucIaG+WpRTCIKq0W21pJKj5l+Gpy6J9F8JV
	C3LqT2hwW/4p3Sww/4bwi2+RIxMN2XCvPuORCgrkS5jBIeB6lgFMfb8wcvHCWlZbUfKQL1Rv3Bs
	2BEkuTKrSQcATfuFisebQ8BLxozQAPvm3kE3ps2/gbnxEpp
X-Received: by 2002:a05:600c:8589:b0:485:39d1:b500 with SMTP id 5b1f17b1804b1-48727eef71bmr193388595e9.16.1774883216135;
        Mon, 30 Mar 2026 08:06:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b85:b2a6:8671:75d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d38a5fsm284031295e9.12.2026.03.30.08.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:06:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] media: rzg2l-cru: Switch to v4l2_subdev_get_frame_desc()
Date: Mon, 30 Mar 2026 16:06:39 +0100
Message-ID: <20260330150639.272174-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-30601-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 06DF535D7EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace direct v4l2_subdev_call() invocations of the get_frame_desc pad
operation with the new v4l2_subdev_get_frame_desc() helper in both
rzg2l-csi2 and rzg2l-video.

Drop the -ENOIOCTLCMD handling and frame descriptor type validation as
these are redundant after switching to v4l2_subdev_get_frame_desc().
Set fd.type to V4L2_MBUS_FRAME_DESC_TYPE_CSI2 before calling the helper
as required by its API contract.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, this patch depends on the patch [0] posted by Sakari which adds
the v4l2_subdev_get_frame_desc() helper.

[0] https://lore.kernel.org/all/20260329195625.2840728-1-sakari.ailus@linux.intel.com/
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c    |  5 +++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c   | 18 +++++++-----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 6dc4b53607b4..1fdd423f6e6c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -737,8 +737,9 @@ static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
-	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
-				remote_pad->index, fd);
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	return v4l2_subdev_get_frame_desc(csi2->remote_source,
+					  remote_pad->index, fd);
 }
 
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..e701a591ce8a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -406,24 +406,20 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 {
-	struct v4l2_mbus_frame_desc fd = { };
+	struct v4l2_mbus_frame_desc fd = {
+		.type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
+	};
 	struct media_pad *remote_pad;
 	int ret;
 
 	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
-	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
-	if (ret < 0 && ret != -ENOIOCTLCMD) {
+
+	ret = v4l2_subdev_get_frame_desc(cru->ip.remote,
+					 remote_pad->index, &fd);
+	if (ret < 0) {
 		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
 		return ret;
 	}
-	/* If remote subdev does not implement .get_frame_desc default to VC0. */
-	if (ret == -ENOIOCTLCMD)
-		return 0;
-
-	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
-		return -EINVAL;
-	}
 
 	if (!fd.num_entries) {
 		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
-- 
2.53.0


