Return-Path: <linux-renesas-soc+bounces-9299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8598CE78
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 10:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9D3A1C20DC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 08:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772B2194A67;
	Wed,  2 Oct 2024 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbgi6U55"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4519414E;
	Wed,  2 Oct 2024 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727856723; cv=none; b=ALLLRNM/VTrqrHHIBm7TIWPh85KTGNwvU49ndTt1RylSk2sOkKm1polD0stVXWtHQuubC4AeMkbwmXFHK7ZtfwmWxVo8xaG/ox7Vui8zKMziIYMMzCB9De4ZKWQnp7QDfCiAmrSByxsKAtWUFpkpzmvUnGEpJy5++f0S/ILXZdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727856723; c=relaxed/simple;
	bh=70wnDyxHCzKJTJjwowzBQj1Ibokxz5hy40NjX5cZwkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Cxw/7uf6WRR8ihQZ+D4AWpYNfowLQUQ6FZTTu/e82thr4Rm1kVKW8IW8XGkTtkms5t14zdRNsQW4BqzuFBr8AHd9mW4b6C5Z6hp3TzSKdr2z9N8aypxcHghxd0jHLyNGvxDy2v31cT5OfhgbB5NsyQX3h5Ywcj3AjNZmefuPoZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbgi6U55; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-718e6299191so3447895b3a.2;
        Wed, 02 Oct 2024 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727856721; x=1728461521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwYW3aXkOfpbJFEkTcyjA4Puz8SUEOqTQONRZN7kTSM=;
        b=Kbgi6U55T/+r12FP2mho1PlDEjRUSoKyIbMrgQrpRlh9Y3dnGLWu/y2Uda10AEQR/A
         aABoT5QVsmFq5u2+PMZT6bwSF5qeajuiqC+YNJ0RgZhUfdIXb/JM5eSBJUOs45TcDwM4
         1iIS62OqHxbh+qb0lDADEd0B7Xb5zgDsdvUMVjfTQkTf2I8bp09edPM9t/opNsZgw19a
         hJBaQhbA3VV2uRIezkcgpfl1ipld7pLWzQLwVpi8PddSOeZkrJRGJ7uOXS9QnrHcriiO
         xPJeGWZAYw2ejKvXooTL6LysXl/UE5fpDlBf0ipJQOJpoWLgUDNA0j3uKfpQG2e8u4Hd
         EP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727856721; x=1728461521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwYW3aXkOfpbJFEkTcyjA4Puz8SUEOqTQONRZN7kTSM=;
        b=xI01rnq5NIXvg+wYhc4900tn9Qs1J7jP0QWEF25x6XiqU8FRRmMuo+45ThYjIvFP9A
         IqMTmzJ8vmVUyVl4yA3VGRX506jiHWVBsPUoO9RFhs0E67iV7hLHNFj6aJumyaxJqSNx
         tsJCVUJ56NAjC0HBFJr+5pw5TlkHL/ldYy91B5Rw9aAXkyOs9gpj980Z7gq0+np8QSyw
         YibGPyZmn1LoflAwuFs4rxE8f2t0Y72ZAlTdUjtLU0KaAJH4MThYGAkcdODj2td3nKng
         Oi+E1tKz90/GYQGVuDD3uu0FJqtVTGMR07ugvgHMq/9nsja8ogBo4tOlazeDAePSO3IZ
         efLg==
X-Forwarded-Encrypted: i=1; AJvYcCV7zsKmg6C2bqpqRrYJjTkXojvNUbK0RpgtyQ+YvNJqoIPA7+FSbu9lTaHkCAn+kgSu1H+RDX5cTQJg@vger.kernel.org, AJvYcCVzopR7mYBxLgjmJvjbh8jQtgxg0+ApLu9YkhLf8Gvb1QjBsqoN8xD0W20Pgx/Uz7ijj9WaGJs/wOFq5W7JNNRRo1U=@vger.kernel.org, AJvYcCW+FGj7YAmtCI7BHfwgSWvbjNOOYljSaVs35RP+CN7FKaL9gpUM2xHiVQqt5CEOdZ5Ew+qUqigbP2QF+Zba@vger.kernel.org, AJvYcCXHxuPfqSjnP9fEO0d3ZwNlKf2HFfOa4XVx5ZLhNjWLVDSGtjshD9hTOQ/uxLY1aNDTnVke70fwwtAB0zM=@vger.kernel.org, AJvYcCXL77GWNTDGLSbmikL9UBsDcpWqiRzJ01nOoZ3FgN8WEqxmZpMl3jb/gmLoVUgy/4nXGpsmBht2fkTz@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXl/JIyMfPbxA/d0b5bSw5angf66ppa0yMrs2ysbsO/hhgXBg
	MnWrl2a5B88rF41MGoFnKeqg7+CIqG6LavfJBdPlKbtH6MCJFO+b
X-Google-Smtp-Source: AGHT+IEWAQq/PDSNce8fNJCMrbE725mZU0WLJ3wtGPmqrDfOR+mYJ2PBSVZQSCoG2J59ftPf5NXxkQ==
X-Received: by 2002:a05:6a00:8914:b0:714:157a:bfc7 with SMTP id d2e1a72fcca58-71dc5c8f1b3mr2659166b3a.15.1727856721040;
        Wed, 02 Oct 2024 01:12:01 -0700 (PDT)
Received: from Ubuntu22.. ([219.91.95.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652b4f6sm9618115b3a.174.2024.10.02.01.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:12:00 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 0/2] hwmon: (isl28022) new driver for ISL28022 power monitor
Date: Wed,  2 Oct 2024 16:11:28 +0800
Message-Id: <20241002081133.13123-1-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Driver for Renesas ISL28022 power monitor chip.
Found e.g. on Ubiquiti Edgerouter ER-6P

v8: fix mistakenly removed Reviewed-by
v8: fix incorrect use of dev_err_probe
v7: move dt-bindings to the first patch
v7: fix unreasonable code
v7: separate voltage, current, and power reading functions
v6: shunt voltage in mV and revise code
v5: review comments incorporated
v4: property compatible fixed
v3: changelog added
v2: properties reworked
v2: calculations fixed
v2: shunt voltage input moved to debugfs
v2: documentation and devicetree schema reworked
v1: created

Yikai Tsai (2):
  dt-bindings: hwmon: add renesas,isl28022
  hwmon: (isl28022) new driver for ISL28022 power monitor

 .../bindings/hwmon/renesas,isl28022.yaml      |  64 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/isl28022.rst              |  63 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/isl28022.c                      | 536 ++++++++++++++++++
 7 files changed, 684 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 create mode 100644 Documentation/hwmon/isl28022.rst
 create mode 100644 drivers/hwmon/isl28022.c

-- 
2.34.1


