Return-Path: <linux-renesas-soc+bounces-11590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5C39F881F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 23:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A940D1890BCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 22:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658E31C9DF0;
	Thu, 19 Dec 2024 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZZ4JQ61V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6AD78F4A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648953; cv=none; b=EwJ8dGslvYKNPE5sOfQn76D5m5qAZJ5varu7TzK2XkihnYeAI/WpqTil1YK5W7ugCClEPEfn/eSa1kh7G9yaIoJwfTwJfNN7HAqjqJAsx9n1eT3ek5TEcDdNfExcbiUlkdqQa7C7z/M3joybhiXDq9MeSI8kA+wl3fqZMEou+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648953; c=relaxed/simple;
	bh=D2iNjqSHjhbEqPJcpq6s+/CShwzsp9Mkz+uz3wOyI2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SWeSZvVOmNss5N5QvultS6busGNayNdAX6VxZ3JNFlXVIx1BFIETc5/xjGGGeQAKEwgwHj7W0n8ItassDfNUOazQHfIVtBODc0M90fWIg6vNSdgH2zn0X6zuByOLoQqmy5RhiVg809s7/SynUwr8QOrkiK1lIk9NV86K4OA4Wvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZZ4JQ61V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Y/TpHgHLWeOy8L
	Vpv/rkfl/76MFewty3I4nXnjTC0t0=; b=ZZ4JQ61V+KU/RNl43nVZICPZ5/V9Y+
	r1Zd4dyvnhEEyankdB3N/8ub9tOAQzZOlWsSDqd3t5f111a4RoR8z9Yl5e8ayGXS
	mFXQHHBw4SwEmnF7e495iQLXBKZaDCBlSGIxuUFXZIKH2JTAzm2D8dlOyWXnZ/BJ
	l+cVdk3N3dOeGllxDvKVo7IykMxjJLIi9QU75zEd8SnAfq1BjvlbuL7CG27bbcsj
	aU0b6jUZfuLxjuqZKhDnHtA1Nr//EzEJdv+QingkjABxA/CZD7GBnJRXGOpbsV2I
	V2XAvrX9MPWrL/mpPxG2MCwvmLkLjYOQQK98t0BLU82DVjDXYmxxBB6g==
Received: (qmail 826561 invoked from network); 19 Dec 2024 23:55:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:55:47 +0100
X-UD-Smtp-Session: l3s3148p1@JDFSbqcp7KgujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH 0/5] hwmon: (lm75) add I3C support
Date: Thu, 19 Dec 2024 23:55:22 +0100
Message-ID: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds I3C support to the LM75 driver to support the P3T1755
in I3C mode. This series is still RFC because there are two questions
regarding the last patch which I would like to discuss. Check the patch
for details.

The patch is based on Guenter's patch ""hwmon: (lm75) Hide register size
differences in regmap access functions". Find a branch here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c-broken-out-experimental

It has been tested with a Renesas RZ/G3S board. Find details here:

https://elinux.org/I3C_with_Renesas_RZG3S

Please let me know what you think!


Wolfram Sang (5):
  hwmon: (lm75) simplify lm75_write_config()
  hwmon: (lm75) simplify regulator handling
  hwmon: (lm75) Remove superfluous 'client' member from private struct
  hwmon: (lm75) separate probe into common and I2C parts
  hwmon: (lm75) add I3C support for P3T1755

 drivers/hwmon/Kconfig |   2 +
 drivers/hwmon/lm75.c  | 230 +++++++++++++++++++++++++++++-------------
 2 files changed, 163 insertions(+), 69 deletions(-)

-- 
2.45.2


