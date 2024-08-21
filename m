Return-Path: <linux-renesas-soc+bounces-7977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43803959AA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 13:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5FCA1F21121
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 11:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEA61C6F72;
	Wed, 21 Aug 2024 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdr0ltPg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AFC1C6F79
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2024 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724239840; cv=none; b=FeFzAXnwAQpEaEk/Gij2vE7iIysBITDyUafMvptJHE++wd4gtTZlDKubhqwO05Zdzkt6bJUyk7h7jbjr0pBQsdufnK4COrPnyqtmBoH04gY6qDhRq++1anD1knRapNaOF0ZNstOQ0QH/ANxd2pNIFkGx+4vkDU6fkPDft9yqgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724239840; c=relaxed/simple;
	bh=AVUhIkDEAi+59/SmEqcqvULMnDR65s9z1laiHUqLFa0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aj1S5A3KfboXNQP3TkCRfy3uuAUoGz0wIDRTRKbUvDUZ4rEQ/yR9krWdCXKDHNHv6NmWkl+0UKmU8AGIf65FGQxvQlOb50N0lLu/BVgTSe0ch3W2/ZCcCE8fl2wfGWn2gR0GcqDBZGBt5wA8bwO3edY4XESRbHQ8KDu3JkAPT54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdr0ltPg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42802e90140so239405e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2024 04:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724239836; x=1724844636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THxGVu0Xud3iDAj/eeQwz/fsrIAzbBZw2iWC/A2wptI=;
        b=mdr0ltPgsvVz18zXEE2ATA55MVPdA8KvNspy7Vf9eyFHgCJoDkdPZ3z88EGoBrOQun
         E7DGRSq3y03/8F9JNwuVaKp17AHZEui1257/Rca6zgbXZiQu/BtREZhRJYhud61NcujK
         aAGHtVIFgwhlT/QehQrVpa9HutSgsqzmNt4vVy8b29pZEcxCCdyWOf1rB0zcZJ/wJWCk
         sKlGiLwHCV+H4j02I29+xOagQnPdoT6R8iIdWrWnZXBPO+DUa6fq043KNn2R+8L0j0D9
         7cPRpKepOIhVJt/peSpwh2zsAgsf2pS+kwjUFZL8HTrCa5RL+PIlCjy5qyOAOSTsI+6c
         bV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724239836; x=1724844636;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THxGVu0Xud3iDAj/eeQwz/fsrIAzbBZw2iWC/A2wptI=;
        b=O1VKlc8GIBSvZxweqmuOUmNOoGPd90WzH2rVen1epCZ/dL/3cEXmqbH5iUEsgTb4+k
         9VrEVRf3Yr20uxvO3c7Y8rm7MSHuSjSBpBmtqwbhdHK6H7ldIwWdXHe119FVGmeEx/Nm
         PuEX7hybQuf5OOvkNXlrPZvC1O9kR0YBIScXHrp4zvSKgOf896ur9xieyHdkLXUthg6z
         UeKTiFF5y64w+SbfuefoP3nO9TqTT0bdCcrP6nVAqnFTisPk2+lFU7O7AGK3bTT8K6DN
         gMOiJAF5sIi+KnA0p8T8mRiK13UK0Umhjm44IZsxxuhCXF1HviOf4WQ1+jHe2llZlmMi
         3IEA==
X-Forwarded-Encrypted: i=1; AJvYcCUgrVHH7sd8wf5ASDgHxdshZ9jHjWwdm7B6pmkosfGxGbauKEoDGg2hsVjyW0laPIYKZYXezflNDjRvxg9LtG7S6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTAIOYxW+rsPwX7fEDSvw3jv0p9Y84QZUerPqyDqBl6Znk8mot
	3B+DtprykNyG0J+uDkCRlE4I26wPgd4e85M10vbzQAJDNsOONLBgV7Rdc0zEqyE=
X-Google-Smtp-Source: AGHT+IHR5gMkfPrqC9UlkUwVfvIadHvW/cvW561WJ02xE5zA6OAufHU5z9kO7FIXIsl4LVbSXJtxpw==
X-Received: by 2002:a05:600c:3b1c:b0:427:9f6f:9c00 with SMTP id 5b1f17b1804b1-42abf140258mr8504665e9.6.1724239836432;
        Wed, 21 Aug 2024 04:30:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef97af7sm22028385e9.25.2024.08.21.04.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 04:30:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818172930.121898-1-krzysztof.kozlowski@linaro.org>
References: <20240818172930.121898-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: memory-controllers: renesas,rpc-if: add
 top-level constraints
Message-Id: <172423983499.253162.12257788864669640405.b4-ty@linaro.org>
Date: Wed, 21 Aug 2024 13:30:34 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Sun, 18 Aug 2024 19:29:30 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.
> 
> 

Applied, thanks!

[1/1] dt-bindings: memory-controllers: renesas,rpc-if: add top-level constraints
      https://git.kernel.org/krzk/linux-mem-ctrl/c/eba8a7b05e21ab1baa0394eb7e915312303492fe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


