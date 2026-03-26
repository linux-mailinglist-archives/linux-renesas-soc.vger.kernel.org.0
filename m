Return-Path: <linux-renesas-soc+bounces-30314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CgcOif4xGmC5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:11:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC2D331FA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A552300C7FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 08:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BC13B2FD5;
	Thu, 26 Mar 2026 08:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsVtwG5T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DB4377575
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515508; cv=none; b=eBBQcn2z5RUTrUEk+ZRLMvBIGL4s/kqxvqWtsQeJV6Xhk4U0VXPUOnFhUFeFVL66yIZX19w2CAt9ytxqB1aG9wfjK0c3eRpjJl+K/rVXJn9Ql9C3jbmjLKFH7HJ6r6Sq6MskLLpOa4KFS6K5t9R4Ihk+5v72npcCB+LDEe39MNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515508; c=relaxed/simple;
	bh=QSCkfnKsrDZTYKx1YNAx8qrghSr/qzKl+1Bjc1+JQgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KO46+3zoN2tSWxrTG/fUj2+uGt9mQEhXf1InvVADevVNn4Be9aco+Kf0m3SLCUH01OfyARF64Ij91bJ5I8tR3fTLW9+9IO33tP3xXhQGQKXxyanxASySQoXwOyCxrbIYf6rbSDF2/ktxovq/EoBgFcflF+vKBgzJi/14acS/7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsVtwG5T; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b9b190easo445699f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515505; x=1775120305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=;
        b=LsVtwG5T1mNeGhp663UJYgFUSweYfBrKfqxDtL6ojK8cb+buumXB8by9pLMtpxhpcx
         6f6DecKQmrEEp8n20G4a5RFoPPML2sQ1BlZlBMBY2BZmpNnSpMvmqGklMGodwh39X5HA
         6sXQohbBPB/5tGZQx1TUBx9frAtJEHcttsrkI7xW7zDhMIuBvG5/HpAQm8iY1hxU0rtT
         DiJt2R31sCkzS1yvrFx2KtIjeg1wu6Fhlx4cqPlS5z5KNW3zUTYYpGtKuyW4LHBn3eNU
         KPYw/KElsOAk3ZUtiUo+J+lghJd2TmGuL9CVJTrvlXWEC9zp9wfVTU8e16NUq+ANvAvG
         j2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515505; x=1775120305;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=;
        b=A5oDUsN56Q+e8HjLObHNNPB7pjseTizEQrVA1Am4SmhrsEc4N/2ruVgt5f3xIOWh5j
         3XSAD+NubG2fdYW39Izm6qQ47wJDOX/XyLoQnxnbx4DxRyxWBULyUrVjixRfEv1UMo8Y
         cefWjni5LNMEM/uPGRZ3K3yCMfOu4OJeXgOMBEi9L7q1g8OvrIxE9qyo7w9+2nWiIBlt
         L4mutMptgdNxmfhPOv6MHpMxCN2gtLUFpCpSCZtEl/Z58Fr/CDHycIQklZG+pWXTxflW
         obr7ShhGyvSg4kSq9uFZV4uNJJAV/hlvwwvpqWrIiQpo+QXs5CAzhG/VNTp7202ND/5V
         UYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHMbDUXqwvIg5B03cBesgKqw5jrCLzh3EhjdMUUl2N258LBBm1/JivAKlJjRA0+NOGb6QsWAKbpCKKtOHgqPKsaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIh2x6uIJfqyCTR00BGz82CACVEKH6+0in4Knvkht7JnnTMzBt
	2N1/RulJBd3l7rlYg3K5Aevs3TrWwTWBrUsxXOEmBwMbcT8ytmAT4tVK5VbuV8aHNDBnvJYjr3a
	uKj3f
X-Gm-Gg: ATEYQzyOuxMlo0zUoCCkEAHsdcn7iIyfUvu67RJRTNIq/964mU3eh2vmNI8+FY2NYZW
	AfyUX+bMU+zwD9iuEd+p4L2AfCt+ydeV/MekAbxtIVMQB4rl3Z8BcbqEoBldt8T/xIHuVbqhydc
	vHtKY3UCOlemy26FXQE/eVuNaXksnIo6JqfL5D7USbq2N9F+ek0yPqYYh9PUpBUiu5eR4SQB4Dk
	rMvYUwUcBaXVXmKCrrfuTwo/+RaN3qDo1W2e/Zcue6iGGroQIjJZqZqH6Ub2RdPigCKiajOejMP
	n/EDEOgGT9V8ltZdJM0EGgETP+RP8B+zgs1HT5wqmMxBnEScYXw2W6EsG352VNB3Hj0KxfersQn
	LP5Zr0Ol1X3GOtmBcGTTtbZkKvXn/5PxgKTmGmjGlWqc1sW9EAoOLesC05H6ISmKhQPzk0xQvSm
	Uqx/od+2IlLlCIqm1H+T2sEoKeDfZ2e60tn2SVvPo+Ytuv
X-Received: by 2002:a05:6000:2885:b0:43b:4881:cee with SMTP id ffacd0b85a97d-43b8899d440mr10250351f8f.1.1774515504858;
        Thu, 26 Mar 2026 01:58:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e708asm5849382f8f.36.2026.03.26.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:58:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
 Marc Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
References: <cover.1772643434.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI
 interrupts
Message-Id: <177451550396.95191.10019790997295547194.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 09:58:23 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30314-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,googlemail.com,linaro.org,samsung.com,nxp.com,pengutronix.de,gmail.com,kernel.org,nvidia.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEC2D331FA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, 04 Mar 2026 18:10:57 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.
> 
> This has been compile-tested only.  But note that all such masks were
> removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
> dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
> systems")).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts
      https://git.kernel.org/amlogic/c/ff6c02a40dc8706c0b13b3b12cfe228c38bb7857

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


