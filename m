Return-Path: <linux-renesas-soc+bounces-29057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMnpKNTbrmkEJgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 15:40:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2663C23AB01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 15:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC99D30263EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 14:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC13F3D3334;
	Mon,  9 Mar 2026 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O0a2H3qk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YO8w+R6+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DDD3D2FEC
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067165; cv=none; b=bOEAEf88qZHtmAyaGiymeNSZyOAFicGuJdc175v6oTX6AM0yB4vGBGpT3hVXDJKkEimEKgc0NU/ruorIl3pK4ATEKIIUvR+Hc4MuTnAojD+aqPoCkNJQgatequXhqxgBae8ifcvtVrMiiQKJ+0eS+guGMqpqMiGuMlXfS+ZsiXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067165; c=relaxed/simple;
	bh=RXu3NphZGUJJazeYHAThPbRn9NwLQx4SYJlxf+ZptIY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V7zG/KRDkksE/fH6cd/qaCpPKpnb/LOSRpiVIm9mF+HbgfzbAZ6lTFc5Ksw94NCJf5XsV1f30bqpPo1wcpgcL0JLsL99VYt62BkFPGns01yrKP7a4rIvGgclFc26LFXXk5FsdeCjkHmMpHLk1m0gSqH6WUi85X2h2Z3ITq3497Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O0a2H3qk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YO8w+R6+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SoS+3CWZlZnGbnfPaYdYtldz6vhvlQlhdk/Ns0DT5PM=;
	b=O0a2H3qkPlQvBh4QXtqIY97BvkliFa0NqOTmY6A+sqN5Bqz9EWwuS0u2y+JntG3rypSkE1
	oq+jclRjQSUU4/mDBmAf52Ik7i50pN1CCr7XVpgWsggB2iN62hPJLqU5EBuw2usSl3CXFQ
	6hT2Qsblcqd1jkGGLTb0M/uv1LIR6jg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-h3OOta4kPSa9ifgWiykT6g-1; Mon, 09 Mar 2026 10:39:22 -0400
X-MC-Unique: h3OOta4kPSa9ifgWiykT6g-1
X-Mimecast-MFC-AGG-ID: h3OOta4kPSa9ifgWiykT6g_1773067162
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso3821322585a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067162; x=1773671962; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SoS+3CWZlZnGbnfPaYdYtldz6vhvlQlhdk/Ns0DT5PM=;
        b=YO8w+R6+R3oWx3JkD9pXszGBFh1KE+xVwi9daDEGTgcZmNiGJKovdedQ5ABLwW7Gy6
         Ix1xQUBStlDRQQSITxh/H7Pop8M1Mclk52W91LNLA9Qf4b5AoagUuwoksol3fqLpPMNl
         Wd7/HPqt6brsPUXU3LTLZyIJM5Ju3ScUOPX1h2m8OORF0DD1RmWUWSXA3r0nQTDZa74H
         r6PAUC1zeOqrarAJQbL9yFktKPBow0OmmvmwQyGqU0cC+IslwFNv9pVw7z4bTdpxVPqS
         OwopP/Lz5OsT5rrOAP3ss3Xx47imGShNfgegNBcmClriRQ5+TaAZ41VbKVqNI1lq6jFB
         YhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067162; x=1773671962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoS+3CWZlZnGbnfPaYdYtldz6vhvlQlhdk/Ns0DT5PM=;
        b=Bp2k3Zb95z9RpxGHa8RND+VXYhMBsaYSJQeWy36T4zPVgrjrDASiN9RY0x5eWOZtj8
         PPj1/Rr7Zr39rak+S1y5/KHWXUkkWUQfPG/pF499lG+th4WtCgbl7Gvx1I1AOweEiNtV
         3Iu00z6mULpOTsHXVQZbLQeNxjuJAiGyZJxS/TucN+5fwLgwidoaqwTfIC1TnbpCTPPv
         qLvSInv0ZxFp4rkikJApzBBek0W06VjiwTQ8vWfsxw3yHWvmydSgqOnXIiJdvjsM7ZZK
         c+BenQLOOyf3WcMh9K5MnAzGVSh9QI4fn46v4iR0/jl7XYoplbWNPZanMIPg8r2db/+p
         QnDA==
X-Forwarded-Encrypted: i=1; AJvYcCWOCDguNx8gkpZJ5cMjDOZcI3MxjIgjVcumVkfKFG/hOj8cwWazcx7lUvUE6bvAMWr9Fq1kNPljhp26wVaprQRPSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7X2AueLMuQKXUrCUHwFg04IxIoNGf2413PqgAy65tIJLBPg+
	MJRn+hehwZEEafV+r2JwOE3fN3FcP2hiuYaZgCUd9wcc9Hng41oak9cSGyDkk6e5+Bz2wHAhMZi
	Y2GtzSP20/KLuHpw+aU43KCJ8D96bMFpfOlXVuSp8uKhEjXE0yIbnUfX2k1KBPJJ1imkg7toF
X-Gm-Gg: ATEYQzxyusbUZ7sXTuoWm3iev1MuQLjTtXZPa5PGDoZgecSsWmihhUNQ9MhkNUktUag
	p2hzIdgIlTw5b0NM75ni39a53q1SLYjcaw0oP+vZ/b75RLsc2awYrBTa5CMmWHGF/WUA04Mjytg
	dhAjot9g9qYjmQmomgg9gp8gCz6+BEKuilIp3OxIeJyCJMUsnS7HwsDRszkB51cwO7XpiaEAwwR
	JDBhrZJ0dYdJw+Dcj+rxC+HmJUpN97nsV7MPTlo3X3pIN/kwX0TayGlXYxepgIb8frJdk8dbShn
	YPQUh5ks7KDM+E5+Ap1ZaMbi0W66tda6O3xDrgPTA9K6uZC4ZC69+yhd3pJR4PXzpx7Q/TkQ82A
	84twAEpGuuA9bFIknhyLPL1Y0+7y4qNSfUusjK6Gq52uT3OWVKxuAj5gHpCYenw==
X-Received: by 2002:a05:620a:40c3:b0:8cd:8da1:d655 with SMTP id af79cd13be357-8cd8da1dd9fmr294094085a.66.1773067161793;
        Mon, 09 Mar 2026 07:39:21 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:8cd:8da1:d655 with SMTP id af79cd13be357-8cd8da1dd9fmr294088585a.66.1773067161333;
        Mon, 09 Mar 2026 07:39:21 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
Date: Mon, 09 Mar 2026 10:38:39 -0400
Message-Id: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WQy04DMQxFf6XKmqA4Lydd8R+oCyd2mBH0wcxQQ
 FX/nXQqIbFieW2fa19f1CzTKLPabi5qkvM4j8dDF/Zho+pAhxfRI3etrLHRWBt1fXvVLIueaBH
 dPvWeDvQirH1JbCI0B0VUp0+TtPFrdX7e3fUk7x99wXIvqhMtdej2203IkJNwzYEqJUs2O4vgk
 NhSS1YqOJtDiavvL5X6lACa6DMCMFIyNSAmb5wjh42IOUAuf6kMFQukADUwogTjq89VYmngi2u
 pJC/JRrpRhWbR9bjfj8t2gxxjhISuxRJ8xW4dMBnypjcKsWOfLKembmmHcV6O0/f61jOscf/94
 Bm00d5bYLYtco1Pk/BAy2O/QO2u1+sPBLaoPq0BAAA=
X-Change-ID: 20260226-clk-det-rate-fw-managed-4b8d061f31be
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3788; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RXu3NphZGUJJazeYHAThPbRn9NwLQx4SYJlxf+ZptIY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e66+SC7zE6hgIdj/dIW3U+zT8tcCfZ+eipU+4TX9
 wfSj6PNOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiIfBQjw7z3W7R3Wuxylu+4
 fiOxTkAphlfb8O7FuM6HpgnPH6TLJDD8FdY5/qVtl8YMod7Q58vbnVKPG0+PUTsjL7FQYcbZN08
 deAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: 2663C23AB01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-29057-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

There are some clocks where the determine_rate clk op is just an empty
function that returns 0. This can be either because the rounding is
managed by the firmware, or the clock is capable of any rate. Add a
new flag for these type of clocks, and update the clk core so that the
determine_rate() clk op is not required when this flag is set.

Based on discussions with Stephen at Linux Plumbers Conference, he
suggested adding a flag for this particular case. So let's add a new
flag, and update the clk core so that the determine_rate() clk op is
not required when this flag is set.

This series adds the flag, some kunit tests, and updates all of the
relevant drivers under drivers/clk to use the new flag.

Once this is merged, and in Linus's tree, I can update the few remaining
clk drivers that are outside of drivers/clk via those subsystems at a
later time.

Merge Strategy
--------------
All of this needs to be directly merged by Stephen as one series into
his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
To reduce the noise, I am only CCing people on their respective drivers.

Note this series depends on 3 previously-posted patches in this git pull
to Stephen for v7.1.
https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Renamed CLK_ROUNDING_FW_MANAGED to CLK_ROUNDING_NOOP
- In clk.c, give an error on probe if the clk implements a
  determine_rate() op and has CLK_ROUNDING_NOOP set.
- Dropped renesas/rzg2l-cpg change since they plan to fill out this
  driver's determine_rate op.
- Link to v1: https://lore.kernel.org/r/20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com

---
Brian Masney (12):
      clk: add new flag CLK_ROUNDING_NOOP
      clk: test: add test suite for CLK_ROUNDING_NOOP flag
      clk: rp1: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: scpi: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: hisilicon: hi3660-stub: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: imx: scu: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: rpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: rpmh: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: smd-rpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: samsung: acpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: sprd: drop determine_rate op and use CLK_ROUNDING_NOOP flag

 drivers/clk/clk-rp1.c                   | 11 +----
 drivers/clk/clk-scpi.c                  | 14 +-----
 drivers/clk/clk.c                       | 31 ++++++++++--
 drivers/clk/clk_test.c                  | 85 +++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk-hi3660-stub.c | 14 +-----
 drivers/clk/imx/clk-scu.c               | 23 +--------
 drivers/clk/qcom/clk-rpm.c              | 16 ++-----
 drivers/clk/qcom/clk-rpmh.c             |  8 +---
 drivers/clk/qcom/clk-smd-rpm.c          | 15 +-----
 drivers/clk/samsung/clk-acpm.c          | 14 +-----
 drivers/clk/sprd/pll.c                  |  7 ---
 drivers/clk/sprd/pll.h                  |  2 +-
 include/linux/clk-provider.h            |  2 +
 13 files changed, 129 insertions(+), 113 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260226-clk-det-rate-fw-managed-4b8d061f31be
prerequisite-patch-id: 59198edc95aca82a29327137ad2af82ec13295b6
prerequisite-patch-id: 8932e170649711d7a80c57784033a37faadd519b
prerequisite-patch-id: 91c7b1851c5d77e504c49ce6bf14b3f8b84e826a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


