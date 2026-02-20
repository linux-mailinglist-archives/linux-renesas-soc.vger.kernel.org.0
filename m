Return-Path: <linux-renesas-soc+bounces-28356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIr7Ew99mGkdJQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:26:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE91168E46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B0563042450
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4449E329E62;
	Fri, 20 Feb 2026 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWfoKbps"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E860311952
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601106; cv=none; b=aGp1FmAwcsfs6cA+Q4ZiuYxq00bsQW6TyfPalDYGrAgDDONv/VICGRwxrB8iycpJEHd7dgavz6qC40+v6hBXEpkZz84XZmzRZxUHeSzYR9pviMMkkM7pMPGMn9a5pbEW7lw2O21YKfNDP98g52UsgEJBYhCc/ARtu2yRZc561rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601106; c=relaxed/simple;
	bh=lKVxjqNxF857pAdRUQYqyfaci6ru2qb/KBUUw7NA2lM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhgBCAFB7hR27vMiFz8P2fKNT0DnrrdynD7vuptl/vyhGym652bQGLqvDww+io20eobGDXyyNBjiWC50S5o7Um3yMWUOUTbsLY6IGSFaJrjFPt4jXLIRJwTQJuGST0Q16ZmW67zKuv7cIFh4N0rSivBhaCOKnYMXo3/AMPvpnvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWfoKbps; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8629C4AF0F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771601105;
	bh=lKVxjqNxF857pAdRUQYqyfaci6ru2qb/KBUUw7NA2lM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=pWfoKbpsXan5D/t3nFJaa0vDMqgj4sAtyDMS/0ulQ0jye0eYCQ4aKNDvSq0Py8D76
	 qsUuQggJ+7YA6rX56BsvSBM2uM5fSyGsnYahPujNnWv5sRqmWjvcEgVOVyLzpesu3B
	 JJTzqh6fEs6TnIQFfPRc5EsG7W8QbcsgOBzyUnwKh2hLRlP2uC/ZK461yJe1lyukor
	 xddrZs86oQfWjztM6rhcusQqLmK9ZIDccqZGWJGeEAn3HIBt9oWAWz+XfAYX3EQDle
	 isTGu4JVq0KheCVyC7wI0vvwiiLoUTnaIrJSMGoHSXm56f6EtYNU3K19UWccLfi4gX
	 k/RlkEjEjO8dg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3871a08189aso19543691fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 07:25:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUafV7zU6FNLgARXrTRvwAUyloLkBeSjon8m8XlfxC3KAOY2AAbTm3esh+ebLyz01U7uBm4SXL4Ev66LKn5X0OopQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuriKk0TNopl31ZuseMuH/gIpctZ3Km44u/d4Bm25PFFpSwYAo
	rVhk7NiSpOzwWd0FOwUtmCWjnj1Zq7OC/1JAS85B44QwX7uA7Sbpkb8W2kbAH4/COIgiq0d8M7e
	sJdmab4BE0rir5Uxzh/9O3MrOo07qIhC7/WL2f0uPhw==
X-Received: by 2002:a05:651c:198c:b0:385:dd91:a6ce with SMTP id
 38308e7fff4ca-389a5c4c7a0mr483661fa.38.1771601104331; Fri, 20 Feb 2026
 07:25:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 07:25:02 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 07:25:02 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-9-1ad79caa1efa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
 <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-9-1ad79caa1efa@linaro.org>
Date: Fri, 20 Feb 2026 07:25:02 -0800
X-Gmail-Original-Message-ID: <CAMRc=Md1xjJNFdL5nxYwxNwvbOXkUWC8U=T+EzrRsBX0FBKL6A@mail.gmail.com>
X-Gm-Features: AaiRm51Nhl9KxWCs3gI3CqS9MKsh2wHc0CQSKdKPuOuRAl0wbHi5oLezOZ6XOMI
Message-ID: <CAMRc=Md1xjJNFdL5nxYwxNwvbOXkUWC8U=T+EzrRsBX0FBKL6A@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	KancyJoe <kancy2333@outlook.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
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
	TAGGED_FROM(0.00)[bounces-28356-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com,linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,qualcomm.com:email,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: DCE91168E46
X-Rspamd-Action: no action

On Fri, 20 Feb 2026 16:04:48 +0100, Neil Armstrong
<neil.armstrong@linaro.org> said:
> From: KancyJoe <kancy2333@outlook.com>
>
> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
> on the Qualcomm Snapdragon 8 Gen 3 platform.
>
> The design is similar to a phone without the modem, the game control
> is handled via a standalone controller connected to a PCIe USB
> controller.
>
> Display panel support will be added in a second time.
>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

