Return-Path: <linux-renesas-soc+bounces-16179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C9A94323
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Apr 2025 13:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE44F1896F52
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Apr 2025 11:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F7B1D5CFD;
	Sat, 19 Apr 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tY6MTNu7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E775193062
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Apr 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745062765; cv=none; b=a5AydBac8uMl1hE/s5wNxeII7oJVY8/i5JjDre9xMTyCGBpOJL+tH++MFfkCpx2rf3h6xWc9146S6WonghJZS8JeIIP7SpTcnlC3qSmeMqqutAJa1xXppSPfKI8xnb0cZYDfm9Lf5WzOudn52IcDtZCouZi9ZTXC6iq6A2rqC/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745062765; c=relaxed/simple;
	bh=2A2UVdf1mOcrhJ3bRj8He0+tcBB9zyGlXLSlatqP2BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiDJGonPDABkVG4taeJbzF2kjeIfXFeDC0IGQt1fgCkr0EcEo4hdJBrzpBNvByL4dnT/QdRE7NWNvr/4L38iNNtRzITHV6iofQSCqQr066rJRTp7ZlA6M6HQPQTGIvTI4LOp52GEYG/eDkwgWL8VOrcj/bmHBsXoHIXTdTSaHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tY6MTNu7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223fb0f619dso30178525ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Apr 2025 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745062764; x=1745667564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naTUGcRXI+92SJRUmQQLlU7HwQfEquV8J8DD6ubm8Vw=;
        b=tY6MTNu7/6mzKzOBarm9fKvJYplmrU6vun/LaZwV6CjFV1gb2kOMidgZAMwoXisBia
         R7ab43bojby/NbCf42GB9hB6fXyykw57SRuRjodS9aex5OAiAS7NyrZrvaoWk2V4k7KB
         a+RMkrHtkGVgdajCbk++GF5Ab4v9GYqovBPUC+3oHVEIo9gBk7ECnZmEQRVMUqlDNOya
         yEJShJUiWM09M5N3Glmq/oeMobVayLEaPvHnNHRKewGKqYDNIST+2UYnZKM5iHRw7abE
         AWUo6YL2XqwpxglxJ1a2ryOrIq5Xmk8BtRctySVoLh535445hxtx4JMQI5ooDnhaJphf
         XOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745062764; x=1745667564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naTUGcRXI+92SJRUmQQLlU7HwQfEquV8J8DD6ubm8Vw=;
        b=ImDhCf5oRjUSZrxB1viScfwLvZWIQjz3eGcMIK7liXRYWCMjDUy5iZLvk2CeI1onog
         LTd8T2dGq1dVVwsksN3jisIZWhw6zhVEl+97/3VI3lEDeKRA8nPM6IghFm6AYOo+5lz0
         MzIJBOLpG7x4FM9UYlZv6LD9UM6O24oGX3q4O1C5PCgtDlTlxJv94293DU1zV9/LvijV
         J21rHm84QWcsmydZbc1hDmkCWh7slctkVF7JS7OpufEAXTT4KXWDrz8G4Viz5Kt03F5x
         JfBDmVsNkueiQQbbVfnCYDpSd1ND1vAeP998JX11tu/UzCw0o4lPA2zJ9muznxq0wQFG
         9f1g==
X-Forwarded-Encrypted: i=1; AJvYcCUfGWRQuoflEdafOlWkDtgRHByCTJnZdgXLFbcXo6DKFSqlCzy9A6rbSWjqQWFN6YU90XLR6JwvcO8JUh7tEEFvJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytLdfweUgx8iL1g8wLgYfrcbEzKMJOhgqGod/0yMV97xWgPUnC
	6IopnsT7Qe4vbhGmQoRg2hWDkv/IMX+M3DmporM2ceXyHMMarYHeLyr/BLu29Q==
X-Gm-Gg: ASbGncvMfGcXaw6K7yuipbF5W67oBI0BcZLGorLumjue/pAJMMtQX5/FfbYsuLTUURQ
	qbri21wWTfARwv9RyKk1LHxz0kI4BXA1lBzSvo6kGcu/d2V6N9r9ZVDD3AP6YN/Vp6Ms5uIJ02c
	QCUu4yAuAXd5u0ydi/nXVEgoH5Pro0LOS/6XzIWIxyj4gwPMWIHV20HMo+kOQMwz3z7Fu/HNmXo
	GOw/F9XN0LUCgQiISCstzskHDLyNstdeLZNHrsOVPUL8ioGaWB2aRYEYVaJtXv7JDO2FDRoaHiq
	y8EuVymOc7iC/C6CRM6divqqB18Fc5y2kfngW0NMKaEuoE0Ccn2l8sWpq1qELja2
X-Google-Smtp-Source: AGHT+IHODxROKgoJD0x5IRy4FMJDEfuxg+Ej21GAqp+g5b67FWig1NSQdI9leulQiZTNSUnH9Te6Kg==
X-Received: by 2002:a17:903:19f0:b0:223:5945:ffd5 with SMTP id d9443c01a7336-22c5360be53mr95211775ad.32.1745062763804;
        Sat, 19 Apr 2025 04:39:23 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaeb632sm3249763b3a.172.2025.04.19.04.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:39:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Subject: Re: [PATCH] PCI: rcar-gen4: set ep BAR4 fixed size
Date: Sat, 19 Apr 2025 17:09:14 +0530
Message-ID: <174506274083.37422.16454115819729459708.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328-rcar-gen4-bar4-v1-1-10bb6ce9ee7f@baylibre.com>
References: <20250328-rcar-gen4-bar4-v1-1-10bb6ce9ee7f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Mar 2025 15:30:44 +0100, Jerome Brunet wrote:
> On rcar-gen4, the ep BAR4 has a fixed size of 256B.
> Document this constraint in the epc features of the platform.
> 
> 

Applied, thanks!

[1/1] PCI: rcar-gen4: set ep BAR4 fixed size
      commit: ca0c5fd2282eff988738539f80b8eb4e1f81a342

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

