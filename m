Return-Path: <linux-renesas-soc+bounces-2168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF578446BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 19:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3857D289A67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 18:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656A812DDBB;
	Wed, 31 Jan 2024 18:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qsiL3ApJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72E12FF72
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706724326; cv=none; b=AraoUYDFCpsHCtTro7vaAgZ3heBarc5LguCkts+BO6qqxHpRZzcWKz+yNR+y07qfxi+9FDNG82SzkGUgf1C98aFJdZwLmabHdbn6/wt0sl75M9QOMi3qc18BBgL534Y0GEHDl7IEzMW5wEyGRHZ+LCieoBLQMa2LCy+rfiEMnPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706724326; c=relaxed/simple;
	bh=bKC7D9rJMglYHu/aMBYV+9UC2Ak6rO3zVSyYhTaYUH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iQmCuQdaIzrNMu3MmNEgzxiaQ1oiCCZf37zIMHiQMOXLDBwCrbA08Qc6aHKXIkE0Y89dXfxQ5dXn2aJxgB6ynqufKfOMCJevacmtGusrU6GipOAROSI19I/9sDyenGGPb1oOPc/9N6kcwW67N8omDUMsHeshvplWRt59wHXqu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qsiL3ApJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40ef6bbb61fso911815e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 10:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706724323; x=1707329123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBGvNSHQReTkUxvWI3aTzUroZ0WS/4BABuj1FjQWt0s=;
        b=qsiL3ApJVU8hxWmoI6JRaAcd5Q5u2Vd9zNOTlx/nNohXNZc/Ko34uoZqGEbNcP/WSm
         r8V+YvfyGhwBCcLMb554QjQskuJEGr9weU1woVIG7AT/h4TP3nQMKAcxQdeJjYSRXIiS
         YZhRysVeKpg5FKm/tAgFzLgtEFiEA1y90/2ueBHvja+Qi+9XaSNRbSuvJfCXqEs/a1CA
         l+ox2ohIkv8126e38kbjqphyWF/KX5SbyBzJxMtcPEX3yzl7/7SkROf43T0rTUlBW/1E
         WEx2qnd7II9qmXx4fOdomrs3Yb1IJeeyfsnSmXTMyol8INCTzAnuq0iwlimDisT+UKZ/
         BLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706724323; x=1707329123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBGvNSHQReTkUxvWI3aTzUroZ0WS/4BABuj1FjQWt0s=;
        b=S8MG500p4MYOhQeEdIFzi+4HacuJ7RFkiy2xpXTd2/Ev8lLAw4S+3GCU7XWfXD4Dz7
         7oHwLLPKUREtCM+Xjt132aXOp/H1sTop8MPTrDBLqABaT89MwifNy+zXgNl8yxj8v+yW
         ihmT8OBogqnuBUih3tYW3VzkTTpCFCHQ+UJ0jZgdtl2PiAjh0hGGk7+gGsruJvW9JFot
         eAWZR8xj06GFqW7nE4wE5GjnVi8pgw37B0S38MtFKpZUNRnzhAKflhgnDG2Int4VUCZ0
         ZcszlWIXvir5dKCgTPM7GbOVWIJG3girwsDo5VGDl+Pz8IbavQEvXhk1TxDZn58uFQ8E
         suMA==
X-Gm-Message-State: AOJu0YywJGorIAow+E42FNplM+mkL0ytbqEIYWQ81xgc3RoOPZpgWdfM
	+O+pf1hK6HoApXRzGmANHHTle5KgiWrQS/0soIFDKQnaHxYWurEn5E1LF7sYZQA=
X-Google-Smtp-Source: AGHT+IFhQZWjOIoalrxTG4X6yo35IoN86zP51MQu4ZI2btj6MU/e0QIKl4TJat8cXTnt+L/sybyxXA==
X-Received: by 2002:a05:600c:470e:b0:40e:fc20:b574 with SMTP id v14-20020a05600c470e00b0040efc20b574mr2071486wmo.10.1706724322668;
        Wed, 31 Jan 2024 10:05:22 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id p7-20020a05600c418700b0040efcf63492sm2166856wmh.18.2024.01.31.10.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 10:05:22 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-isp: Disallow unbind of devices
Date: Wed, 31 Jan 2024 19:04:52 +0100
Message-ID: <20240131180452.844863-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is not safe to unbind and then rebind a subdevice in the rcar-vin
pipeline. Depending on what subdevice and in what order a device is
rebound the rcar-vin driver can misbehave.

Until this can be solved suppress the files in sysfs which allows for
this. This is in line with what is done for other subdevices exclusively
use with the rcar-vin pipeline, e.g. rcar-csi2.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 530d65fc546b..4512ac338ca5 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -518,6 +518,7 @@ static void risp_remove(struct platform_device *pdev)
 static struct platform_driver rcar_isp_driver = {
 	.driver = {
 		.name = "rcar-isp",
+		.suppress_bind_attrs = true,
 		.of_match_table = risp_of_id_table,
 	},
 	.probe = risp_probe,
-- 
2.43.0


