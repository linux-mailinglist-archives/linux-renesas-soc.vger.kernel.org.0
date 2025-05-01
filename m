Return-Path: <linux-renesas-soc+bounces-16572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EF6AA5D31
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 12:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55A9C16FFEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 10:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5942E21B9C2;
	Thu,  1 May 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5iqKqRZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920E82DC79C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095110; cv=none; b=VG1ev+jU2QIJnT1+dCZmKKeAo0VcALHebWZ5aPKR4aPUe5V/l3sn/NM6f0V2C5Bl4FxT3xdFtOVWTUTPbcHkDbrQ52xqTMFCmg5c5dr2pCRXy0zURoc9ewohC2cbGn0taeiwLgp+0F9GRzCFa93h/wpGZJGtt6aqdua+5V89wbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095110; c=relaxed/simple;
	bh=ADQvEKm50mR6UNbZYVV/BZLZgajUKMwolUTg9zjSBN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CM9qXnG3lb1UXRBSLjF/rszjOYVTjrx2p6e2imgKf7pcrpF/oOY5+4QMbYGkhLlYxX7pG6l+v10Tq/lS9S+ZKVZfI5HnxuA+ob1c3kHXImrowDS+/WALv88RRwQyN2UvoXRb4PrFXbyGnwYtl/iEu9dSdxypgQzyoQscIvTXSs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5iqKqRZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1286385e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 May 2025 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095107; x=1746699907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8QeKf70pesc7Cg3qS1NrbHqTa6aVyv5vuZY6Mfumb8=;
        b=R5iqKqRZzTDBdMCM4KnDSp1xctWCDx0QDQoYP/MSbp6aAoYheMh4mBr8E0W5/rfP1L
         qB3yboO7l1DNf8gsix+uwj4oOYWWzR1lqkL4G0XQC+iIGsiBKknraHei7323mdjHtbWH
         ZGfiu7ZLOwhgaxI2hfItk92sAvB2zBAICdw+XonXAp1Kw5SD3LYRR3mMw0qMAsJJWw4s
         rzrvo3FDyudtRJSq1XHxCAp25lwtmmeQg45Lc/1MdcrGjX+NF6gdnbe09zFwtG+SbVCg
         2fi4eNNlmZhhMkMxCzvT/N5SoVACua6A952lcCSauaP2vCPV4JOLUgRcdrsH7JswRr6a
         u1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095107; x=1746699907;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8QeKf70pesc7Cg3qS1NrbHqTa6aVyv5vuZY6Mfumb8=;
        b=DiHUClBuu25Nebv/GfkiwHtm70zM2YqVNe8iRP8zDreGkIlLEXrm/T4dtG5W7TdXyN
         XJ0Qpo14H5QSDPxkvikCmsMhbVlqNIIjEH2AIVLIHzNACTNLVehlbmd7xan9vbXGuc1U
         7be4q1XGQ3wsR32LcNntto0cRhwDDKssVA4VcgGKdARWIm2ufL7eIxpxl7fj98HOySsD
         TW3dRAydwkpwFwAenjwVlbyogIHPtQ/H6hx946O6mb/Mm8gF4LVd4xLUrZt19KlHFn9W
         TPBRrs47L0qOqti6/FzgJuNALhaYlpoy4DLItFgq/irDC+xYsLy6A7VatHIjPoewQ9bF
         QCgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8LEyHSUnyrrfec7ZqFMbw/BIL0nnnfRwAWhUxsS1gf9REm/vqf6MUFleyMGcslgkGOXlOCdZOFPhXdVoQjKB4Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmXEbD76+Ebq2KKeVb8CBcwpXzJfV9yiatxJoK4db6wBLU9eMg
	R73GYVuP/Wz58ZQUORX5Dqtzy2H6QNpNwIDro5eIVUSd83k+fltVXZSm1HEQ4xs=
X-Gm-Gg: ASbGnctKidLSsEId9MzhRVh46WBmdPhlhdhE135IyBVPz3k6lbPfOlKoWP2VEkrnaOZ
	8v/wMBLEFoXvnVW8q4UPT2ECemgjJ4ipJDHhLWJ0sRqBsS5GMzCRi+yxP4WAb4vap54TK9twdZ9
	ub3Z0T7JCYuDM59VLc9hEYLVkRz6h5odn50VZWbq8YMXA2AT/UqxVny6OWaPTuP3YwhWwP6P8rs
	/oXStbdzqMOuh/cslfCoHSdfn4oiyraQM/OyNdpZdSck5xUL3ZDRcsnzJjyDygoDT7f3kOefI5Z
	h8s3G11K9mSmYbxL3ln0B6sn9RNeZd1roA8Jh5VTzrPMekdVin+NVW+QcXqFG3gmGgP/1w==
X-Google-Smtp-Source: AGHT+IE3XQ5s+VkmwCEZfjCDS667uBo9eF8reg6v3ubGqGIeakvR1aaEQkAq7Kdd10KGu/tY+BB/Jg==
X-Received: by 2002:a5d:5989:0:b0:38f:2ad4:6b1b with SMTP id ffacd0b85a97d-3a09417c3a3mr530124f8f.13.1746095106903;
        Thu, 01 May 2025 03:25:06 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8f7e8sm460820f8f.100.2025.05.01.03.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 03:25:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mark Brown <broonie@kernel.org>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250424090000.136804-4-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
 <20250424090000.136804-4-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 3/7] memory: renesas-rpc-if: Use
 devm_reset_control_array_get_exclusive()
Message-Id: <174609510577.12307.14194200303084190406.b4-ty@linaro.org>
Date: Thu, 01 May 2025 12:25:05 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 09:59:51 +0100, Biju Das wrote:
> Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
> existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.
> 
> 

Applied, thanks!

[3/7] memory: renesas-rpc-if: Use devm_reset_control_array_get_exclusive()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c66fce831d0669dc809f90bcefd80ae979e35431

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


