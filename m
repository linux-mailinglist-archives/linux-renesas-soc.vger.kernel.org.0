Return-Path: <linux-renesas-soc+bounces-28355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA0oKrp8mGkdJQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:24:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F092168D95
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCD4D30154A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 15:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2FF2C158A;
	Fri, 20 Feb 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zj6lbrWo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB225B31D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601079; cv=none; b=dFPXmX8y8lq3Yy41Q+pUZm8Qh+8B/4wM6U2W5nx/IdrjtA72Ow7znx7Ehu83xVp/y5X6XXWPU2JSWstkL5aPMugOxYyiv/iRyFD0N10cgrc6o0WI/p8VM9Zfgk0eJWd8clvcBbW0ERNV1eeCHhxzR0LtnlMyNzkLmdAM3/h0sTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601079; c=relaxed/simple;
	bh=C7UX1vN+PR4yVE/b6ioZbNxAI5raDGvTJL3T59+50rc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfD4vyvaw/XtPyJx974PWLk1t3sCf1n15v9bI3cy6GhmM4NdOWzAxJWIOT2k+dUU4llb51rdHwDDNiUufJ2ClDgPnYbjWodwioQiVFkmrvEnzaPP/LPLIhDkxPKljJTf1A3Z7TlwmRDl3G9g0jM4GkoSn3Om9VgTlBrv2EVqBkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zj6lbrWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA54C19421
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771601078;
	bh=C7UX1vN+PR4yVE/b6ioZbNxAI5raDGvTJL3T59+50rc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Zj6lbrWoNtXtX3NgUCv8t8Aqzk96pk/8iJ7xCesAttEZz+e9g8iRYtx4s3wgZO/id
	 RiNNn1mO0oI9gWItnOHmLzHDlSwplX/pr0rStOuc2IkUjIG5oxQGzr6YG/F/qTzD3A
	 7Vb1ElPO+JiklSS3BpryRjMBbAd/3Q5S/Ufy62h9bQ/mRckQtMYxWcRNltJagKN9Cc
	 JmyfF3MxGWG6v3fCeU8bBj1mhQw8EvkVnQzAM5g4IOeJ1VmVAXzQ3ccY8W2JNezxLY
	 ZQ+daIQw7T77hgthQuBbSPsvwWJqyKq2zRQQXV8ikOWPGA+wN3dwbdOQNo19IKTg+d
	 olVsDUFy3En7Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38709eaf012so18944041fa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 07:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ12Kg/Mf5KrZSjdJTBKwTm8N/XO1Ij26UXZ+rXaHRlXuGqIcpcp0J5RZhxWouGaUBepJe/mJWvabUYMRC3Vocvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbmW0FXAgvItLt0v+sp92EIkRz9ryMeEqpIOCbRdRtTuFa9FV
	RzwW/xnad02dJiDF9dcfwK2PPw98KNrbzbqg0DCtrAd3NNSkJKSl/IKyBi2nTTutHxBuZToUgU3
	w6qW8F48r0qRKnxjjWT2TDDIDS2cH9q1HSflfoIiJeA==
X-Received: by 2002:a05:651c:1cc:b0:388:f65:57c5 with SMTP id
 38308e7fff4ca-389a5ced562mr256851fa.4.1771601077506; Fri, 20 Feb 2026
 07:24:37 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 07:24:35 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 07:24:35 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-8-1ad79caa1efa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
 <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-8-1ad79caa1efa@linaro.org>
Date: Fri, 20 Feb 2026 07:24:35 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdKNbxtg=UssdXqjkSaJ6rW6zU8fR0wuWCWzYOzpbsvzg@mail.gmail.com>
X-Gm-Features: AaiRm52MKuxfYPtBpaRkXvDxtG_cv_dL03XUQqwYZ3j9MikHP6iuFkoiT8NsO-4
Message-ID: <CAMRc=MdKNbxtg=UssdXqjkSaJ6rW6zU8fR0wuWCWzYOzpbsvzg@mail.gmail.com>
Subject: Re: [PATCH v5 8/9] arm64: dts: qcom: sm8650: Add sound DAI prefix for DP
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28355-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email,af54000:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F092168D95
X-Rspamd-Action: no action

On Fri, 20 Feb 2026 16:04:47 +0100, Neil Armstrong
<neil.armstrong@linaro.org> said:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 758f87a10d8e..6705922c4d45 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5960,6 +5960,7 @@ mdss_dp0: displayport-controller@af54000 {
>  				phy-names = "dp";
>
>  				#sound-dai-cells = <0>;
> +				sound-name-prefix = "DisplayPort0";
>
>  				status = "disabled";
>
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

