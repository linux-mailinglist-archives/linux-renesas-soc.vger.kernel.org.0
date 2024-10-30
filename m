Return-Path: <linux-renesas-soc+bounces-10231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7889B7068
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 00:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87C81282531
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 23:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D43E1E3DFE;
	Wed, 30 Oct 2024 23:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6lXw5AF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDDD1BD9E5;
	Wed, 30 Oct 2024 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730330765; cv=none; b=rggOkzjDAxebcWfGbNh3lofviW1iaDkDwPj8RhH0ylEjixGFuqbTYz0fE4sPmH5XygP2/QRn6lpc1xQQdmTJPIhC1t3BnwteqAJ7UEtWGt3Zb8aRwXLInFtO+A4Xs+m0sPJ4MFnpmhNYmiA6Wxal1T/t72JoBQjcn2/psC0spMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730330765; c=relaxed/simple;
	bh=ZJS3c9CIuIH5R8ZNBpllfZrelj8hlM7EAnSyODfN+Xs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D485iSidTrahtgZ+6thWJ/OhTPmqPgjXF8qPjJsLidfJnHTsV3gpmafmCaE2zSb4rAOZlVpX9QiKQtCI8gYg8/oP22SWJhnCXLgOuu7ls53Te8EMx0SdVvhewGdecbZunq/Jo7KZD1B2A/3U/8x0rAIF9QGITgEZZK3DSZAZYgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6lXw5AF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso2951895e9.0;
        Wed, 30 Oct 2024 16:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730330761; x=1730935561; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayf5CxyN8YABWU2vthcA1IIkJNbI0/ggxmpxkX56+Fo=;
        b=e6lXw5AFzCpjCPcd+e8pz22vVt5XRatnWgpyMN2ct9FQGdLN1uOJP+fcFOGDvPYw+G
         fDrOZ4BbOKBn63FOVtM2HO0WSRDumwLMP3pnxs5DbqL6/oFVwk+qMX8VT44Ng5Fy2BWs
         O43qXBonK31zDe1p+3p4Ik/dPUacRUm3/DtC1hS9ZU9GozmxUHYpW6MsfPo3GJpO/6g0
         A3BOl/tHimHA9Q2w8Z+9Yshcmnf09vtxr6bTwdckAoMXKXyHfgKJmjJxyS2w96LRmKaK
         sLFWgY2jHYosmjnKt/KidxntqGSfKxuILWbcfRgGDC2YtJRu3m9uZD87va08/t19AumM
         Wq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730330761; x=1730935561;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ayf5CxyN8YABWU2vthcA1IIkJNbI0/ggxmpxkX56+Fo=;
        b=O1Tt0dXm8z1vzL4mXXTpohWHyAmDGGRTdwYKJxM0YXzO6ZVhkOWb3ecCbnIarGv69e
         BnLlh5Zu87IxDWdeUhiNUuOvloXJYMavCbrdXrOHDFmhwBgeNfdli1xMNzTTCXNNuMvw
         Tw8RsIAtdI/mFBDeI+HEep2oj3GtgP5kDFA/zG7Y+mdpQmR6i7wAQUia0C0byNRaMQ7J
         r8NFTqpSpfOQvyX3bTzOAJgsFUPEqQBOM5N2f+766kbm1LeOFzxWYvWpvZMCahJvHj3R
         hBeW9RtaygTnHYxmGipKw9eQ2k4Wr+yVmm0atVtmIn4g+jDQBKTTV8xW9Vl+Yo5RK+Un
         ko3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/iqhWs2kyKJupVkTNrBEdAj0mKa7Vi/ioLjKSE5vzBl7+XqdVceRZBiw+2Fw/0UPaGmTHutk0@vger.kernel.org, AJvYcCVmv9ZIgydNwPk58VNlAZ7epHrYNNr5HwEJq/K/AxIBit4O8ZU/3iEtqnujVSl0SrOo7fm+nL5Mgj0=@vger.kernel.org, AJvYcCXtXyzeiG9jm6nnw9G3HrdE/U99xhL6K4BHPHr3foDDjSB5F41GXnSy19nGJ38dBMe6D3uXG5zpzf9UEwEk@vger.kernel.org
X-Gm-Message-State: AOJu0YzB7ULEMdO3qu7ZerTui6wuRqm3Zlh0X5J3eYYQR0Q9NJST9Wfj
	TuSfamIznlcvAGusGCLKCeMiwsgFd8y6rrsj1+4rsvgHMgbsNJGJB/LDcMDx
X-Google-Smtp-Source: AGHT+IEz/U5uiaiXWQrWeP5TcNccKKF8dYFpWwG65GCrbRFPu/TD7aOJCsyOctmhAHuLNpJ4UY4Yeg==
X-Received: by 2002:a05:600c:3c9a:b0:431:518a:683b with SMTP id 5b1f17b1804b1-4319acacb3cmr128581105e9.18.1730330761129;
        Wed, 30 Oct 2024 16:26:01 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-fbf3-0656-23c1-5ba1.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:fbf3:656:23c1:5ba1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947b2bsm35338395e9.25.2024.10.30.16.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 16:25:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] clk: renesas: cpg-mssr: fix 'soc' node handling and
 automate cleanup
Date: Thu, 31 Oct 2024 00:25:55 +0100
Message-Id: <20241031-clk-renesas-cpg-mssr-cleanup-v1-0-628274ecbfcb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPAImcC/x3MwQqDMAyA4VcpOS9gWxm4V5EdaowubKslQRHEd
 7d4/P7Df4CxChu83AHKm5gsucI/HNAn5ZlRxmoITWh9Ez3S74vKmS0ZUpnxb6Y1csprQd/FOE7
 POFBHUBdFeZL93vfv87wA60C6sW4AAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730330758; l=1109;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ZJS3c9CIuIH5R8ZNBpllfZrelj8hlM7EAnSyODfN+Xs=;
 b=zbkW5IPndQg0IHbcwHCUulMZ8RjIO+7ZYUMR690sPby0fruKkFlwMpjo/PZdrLS5iF42tOc+h
 5m8s/x5H5moDp1DuMix1oXJU2LVNq2q+AVR+DoEiSNdKOG7W7YMFxN2
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series releases the 'soc' device_node when it is no longer required
by adding the missing calls to of_node_put() to make the fix compatible
with all affected stable kernels. Then, the more robust approach via
cleanup attribute is used to simplify the handling and prevent issues if
the loop gets new execution paths.

These issues were found while analyzing the code, and the patches have
been successfully compiled, but not tested on real hardware as I don't
have access to it. Any volunteering for testing is always more than
welcome.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      clk: renesas: cpg-mssr: fix 'soc' node handling in cpg_mssr_reserved_init()
      clk: renesas: cpg-mssr: automate 'soc' node release in cpg_mssr_reserved_init()

 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
base-commit: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
change-id: 20241031-clk-renesas-cpg-mssr-cleanup-1933df63bc9c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


