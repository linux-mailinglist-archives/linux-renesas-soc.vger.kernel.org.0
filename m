Return-Path: <linux-renesas-soc+bounces-9502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA29927B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 10:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F88F1C20292
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 08:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A51E18BB99;
	Mon,  7 Oct 2024 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FY0NUkdW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C422087
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Oct 2024 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728291552; cv=none; b=BBlnt7H/Ba+P4Qe691x0tf4zDGo6HEcrWdgHuWN+sn3GqPR4m6EpVjSXGksX5HBBBcI2viFmw0r5cIoeJ1ShheU60vpPBEsYC6ZdHpGcYvL4WLt/hWNiS3p0Wiu+/qaXuf8Dlw96P+bbglosMWjI+zOnqLPMFtxQuhT0IYwi5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728291552; c=relaxed/simple;
	bh=vhhuZVVwnO9dfXwZL4BPPOq+7WM0qmen7HXYMzh80ho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e2zjuy99cELq+f4Oum7NCaI+KUAs0n7FZmrx7tqITHIvFAPerDN1blWe6qHWrRITthnvJvEELGMTEVSiTi8/RNt3sQahYQ/B/CM2uQjwGrp04CDjove9l/tjGMrga8QAuLL2czSnzbzQm1UHa7LQEuCP2HaxUQvcNLz9PcvthX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FY0NUkdW; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so8134819a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Oct 2024 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728291549; x=1728896349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEo25s673HAsL8MUxp/tEnXdM7P0s/y6pLj2SqPSQGU=;
        b=FY0NUkdW9VsHnx0Tuzc3AaS01od3tHucAsfABmrWbC1O4tMBInkaTdLyYnckyowz0h
         trOM1jDSipimBbaNmGqoD983WUMfY2Yp6WF6tNBZ0uHg0mC2UwnJP22cycNVNPmihmep
         yxswevz8hbyC1+X6ZMjlvxuDWzC39rMRE+qc/Do2m9J+FQFfLEDXPoywO6nirI7Ik4HN
         eBpSyVLN+rEMj1PF4pgsaW3LMiEKi/j0kbbjxLXXJSw0eJ2v/d0Sma/N4x+GhM5MxriI
         aoabbrFN/7bJY59qVaPq6o1E9eRbr7mnLaa+UG8i1449OT/ALrRTWaxOJN/Vaye8DsWM
         GXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728291549; x=1728896349;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEo25s673HAsL8MUxp/tEnXdM7P0s/y6pLj2SqPSQGU=;
        b=rmA7xtp6N6G1uUBG1jTqytA35WJxuioPtRSFOAWRZcj4xE9aRocjcgfsfsPBjBJRs6
         M1NavZ69HEqpdSlxpDkAfQ45wvt60p91Z2hbwhvFFKvk19tCQI83Y+B6qVooA7yb4JTB
         YIuKlQqps8j/lPB47w/tREmchqISo6eEb4uhRzR4B+sOq376Jevtcm9H6IyJHQsFla+D
         XjmYF52rXKA2xFSfacdYvQmpueZbTDzqT5g8d+PCO+nB4YYHxArb9O4ik8IDb5hXOc+U
         GGTv3zPHCwpmUcLp+Nf7R7KA4zfidbxlRC/OwAkQzmRDWFnAEOWWGQk1dtm1IrCBEU4Q
         mT6g==
X-Forwarded-Encrypted: i=1; AJvYcCWoJlv0u2ID9TzeJq6gC0H2MSY0GifEElvGcoMBWufYDpt6Gcgiu1xeosfi6griUlV2DrRu8/2PAseAtCbAD9b45A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg/Hb79c/295y5vhWmPis5h0DSwMMO7Q2tCo2oJrnwdOZK9WhQ
	S7RpKxE5PwkhGoKH8yJr2bs5umo8taZ2DiuxqLCbzVRORsy+gb9lNVp9j7HkrpU=
X-Google-Smtp-Source: AGHT+IFU35Uj2Uq4VSqbgLsUfMd1Mq0DfRI0CmQV3Jy3ET9jvkDSaLfTKu2e8F8U7CjKUALIfZjH3Q==
X-Received: by 2002:a50:cbc7:0:b0:5c8:d9b8:9325 with SMTP id 4fb4d7f45d1cf-5c8d9b89425mr8000657a12.5.1728291549092;
        Mon, 07 Oct 2024 01:59:09 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05945c3sm2947257a12.18.2024.10.07.01.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 01:59:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1727963347.git.geert+renesas@glider.be>
References: <cover.1727963347.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH v3 resend 0/7] Add Renesas R-Car Gen4 E-FUSE
 support
Message-Id: <172829154816.179131.15672013040030058967.b4-ty@linaro.org>
Date: Mon, 07 Oct 2024 09:59:08 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Thu, 03 Oct 2024 16:04:24 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> (another rc1, so time for a resend)
> 
> R-Car Gen3/Gen4 SoCs contain fuses indicating hardware support or
> hardware parameters.  Unfortunately the various SoCs require different
> mechanisms to read the state of the fuses:
>   - On R-Car Gen3, the fuse monitor registers are in the middle of the
>     Pin Function Controller (PFC) register block,
>   - On R-Car V3U and S4-8, the E-FUSE non-volatile memory is accessible
>     through a separate register block in the PFC,
>   - On R-Car V4H and V4M, the E-FUSE non-volatile memory is accessible
>     through the second register block of OTP_MEM.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem
      commit: 149e83f1b385661cae3a60cf27271e6ee53ea6e3
[2/7] nvmem: Add R-Car E-FUSE driver
      commit: 5ac5933d4e06647b83f6b971b18bc894903a83f2

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


