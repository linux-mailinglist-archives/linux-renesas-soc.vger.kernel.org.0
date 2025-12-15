Return-Path: <linux-renesas-soc+bounces-25781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA17CBF922
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 20:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBC16301E1B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 19:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71839299A8A;
	Mon, 15 Dec 2025 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/z+urM6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3942A21A444
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827634; cv=none; b=XsHpi9/Pv6cfn2zADQCkaE0F6GvlS/o2OvzMGNQ6UQTC0qdxg31c5p93m/X52qpJh61H2e/6/Iz3ysGHluX4mNXSktWf2ssQJ+ckje/QKB05nL/vE8Ihvi+/1rPOGHhj5ttksHYNsJ+GWh1YQRNSdnVwTdohpYiuzidfB6EGbAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827634; c=relaxed/simple;
	bh=9y6b7in2ihxMbdfZC7ltYTi57MN5j8PMIpwtOwO3MuA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQ1C7PO5dvjX9wdLa+DMTHBNa0sev3u1j+1UW1AKWvGultUDHEmmyHEhgNmk5AigkGTK/tOSqm6UXXIqtZN+P6fZa3giabh9YOiF/xn8v76szA342XtkEQOa/QmDUByU5Wju4GCJrAhoYLYjOJbJ9HuWyUnkTBUi91QFWXcUMUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/z+urM6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so2904535f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 11:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765827629; x=1766432429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lEzLk2shy9y7ypTsgQweik1qhExZjCZM7//mLI7mL1U=;
        b=a/z+urM6NcCmcznbw5oxHj/gKRbiKtJQuXOwb05c394qijWVDRdFjmvsAz7XexH/Vs
         j78OoPemakb7ltpHKLsFP97w40zYEwA8qGdltY7GfKGXztC6BdiubqsP6Fr8ahltlGbw
         SLK56Fp3cuwpUIoMC42uxg74+F/OC3B5YKl6Gcs5DfHO4qR3DRUh2yM21mtQNfVWEiSG
         9KnsuTm/p7tpwnWhVeXy97j74eiJbNwL3GmadZ5mba9JG+D3/95KR4qKGgwrwQ4yVebz
         Bso0KYwW1v0Zsifyc49VGkGx2+8jItciMabB9zvPddYW/saf/GwbOvmdmvrbTU9a3nQS
         v+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765827629; x=1766432429;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEzLk2shy9y7ypTsgQweik1qhExZjCZM7//mLI7mL1U=;
        b=ndug4DD2ah2dojiRP/L9Ri+rt/IBDB/aVQXei4Kj9ulkxBIh3GWGUS3SS+lJKBAMGH
         MtpfkxYFXf2yisbUONDYLeX+AUohNpG9zpvuAfzLQKGoNRpRytBpgk/RRNQw81PxQMTE
         CQDlxx0pEHrVB/WhBxrQS+YihsTMyKDBYznYecGx9bH9qAiUUEe7rJ//xLVmyDg0RXHB
         87oIRXjwJIs964m+xPwJHIziXFDw2FYgqbsd+of6aeWy9XU7HuPByp3szM93P88Gobo3
         3ouaLe/Qbt81pYFvtkFz/ACVH/Em23h553G8Xt+jypdHFkFC0yt1lYnEvbg6NPzpEm6T
         co1w==
X-Forwarded-Encrypted: i=1; AJvYcCXOWUy3xvZWWh5givBkmpKttGNS85aAvktfRLczZntVyft/mOYdRqceZndoNsXOdP/nc3s5owJnh1l0+15TarmCgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxytcVyi7sbKSl5iaJ75Oo7fPL/6ZHNKOXTpUPrQV/F9cVaMd
	UNYZ/naTCG8sGGXCMkwZljHq6FkJOv2GrOqPvA8n2S95lyvXyUW/sSsKff0I3w==
X-Gm-Gg: AY/fxX5jxpubNy+Azn2QeJ4VnPIutazXVLjfVVOhbC0MZ1PMuoyY67Osenftg2BISnv
	VE3Ywi6ffH3ImCnyRhL1Rc3T8a0ryIppczB7ByxffleDK4cEpTBHT/ez3dQCBSHz5aAQCcgQlzG
	M/f1XdEglT1eY3W0P42BQqy2XOGkL7v60OsW22acR/LCPsMEiwSElgDkWcbzY7KmTWx0kpDqd0X
	hQMRNSaUkWr7au0s1BinARnGQVZAEbzxMVMR7UmfCyfYoALgn8opo76k7TTJ5/QAvFlmaP2eWyc
	GQ5OI73hssbVLuW8zZ61sliFKaVzMJ1vu3pVqA/a91Dhz+8ZKxurMaDZeWt8l2iuJFRci3Pmuos
	OJbGIPG8qAMlfvi69SZfgHWxXNlF2rwm32gvus/j9e24tUSTDJqCfEDXbiLE1d78o3v+6ERvmRk
	zgaFRjcZsUJCgl4L1SiLl1zjeA061WVTQVgyIR7Wk=
X-Google-Smtp-Source: AGHT+IFP8gJNON2onfOKCApiokNk+T6Lm2ub7YeNtGawfNOx+Wvx+oGbaozuj1Z8ekx9b+5qNnJgZg==
X-Received: by 2002:a5d:64e6:0:b0:430:f5c3:39fe with SMTP id ffacd0b85a97d-430f5c33c72mr8793616f8f.4.1765827629338;
        Mon, 15 Dec 2025 11:40:29 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f280cf30sm16923974f8f.3.2025.12.15.11.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:40:28 -0800 (PST)
Message-ID: <6940642c.5d0a0220.f68ee.f1c7@mx.google.com>
X-Google-Original-Message-ID: <aUBkKboJLyCatA9w@Ansuel-XPS.>
Date: Mon, 15 Dec 2025 20:40:25 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm/arm64: dts: qcom: Drop unused .dtsi
References: <20251212203226.458694-2-robh@kernel.org>
 <c2mvshcq36eyigsmo5cbwlpk5usfsog7knrd5djwahz2s7crmb@hpen3pruobgz>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2mvshcq36eyigsmo5cbwlpk5usfsog7knrd5djwahz2s7crmb@hpen3pruobgz>

On Sat, Dec 13, 2025 at 06:04:56AM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 12, 2025 at 02:32:08PM -0600, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> 
> I'd say, either this, or we should get device trees, using these files.
> 
> Christian?
>

Yes I can port some dts that makes use of these. The can run linux.

Thanks for pointing this. Would be enough to prevent having to drop
the dtsi?

> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../boot/dts/qcom/qcom-ipq8062-smb208.dtsi    | 37 -------------------
> >  arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi      |  8 ----
> >  .../boot/dts/qcom/qcom-ipq8064-smb208.dtsi    | 37 -------------------
> >  .../dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi    | 37 -------------------
> >  .../boot/dts/qcom/qcom-ipq8065-smb208.dtsi    | 37 -------------------
> >  arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi      |  8 ----
> >  6 files changed, 164 deletions(-)
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
	Ansuel

