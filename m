Return-Path: <linux-renesas-soc+bounces-24755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB143C6BEC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 00:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 5E65F2B970
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 23:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078202DC79F;
	Tue, 18 Nov 2025 23:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGGLYhhv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6CA2264C9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506921; cv=none; b=J0jm9boWYQAxa0GLV1Hs4E/5aT8tEZfTOdhAwXlYY5LrrWLAD221K7sPeqWU3JNT4LnMumLOn/c5N51SdOzglpiISAh/ueDsFpJB7Kn+p7IWIpgYjfVfc+amABpg17YcO9HOpjthMfqw+PeSQoASs1ia/AIiNTK0hTdsAwxB+yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506921; c=relaxed/simple;
	bh=ufxmL3OK02TlwNuKOGsnXESl740fDQGpM2Lz0lmK6tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7AxH3+NRVoMqNBDtKLT8VlLJqXrTFWq0J9ccx1B/k1XVn4Dc0PHT5C9U5o3m5xBVCyAtv9DFiSEEsg1xKL+Xr0eVKwLt3bKu7vXojLQDQmXjLsVDXxT9/sHNUgTFBMsX5FFRjxZbAl57flqkwdvM3XvV51/gOfy2PYTfpXiYmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGGLYhhv; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63bc1aeb427so5547239d50.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506919; x=1764111719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siCp5mFpWwfh1f8xwoxhUJ4/70DgOMe2vhrDsZwypfM=;
        b=TGGLYhhvxJjHKNPvvZWvUcXqXIPwNOJfDl94hvkRR99/WG8zfQPfy53N3grcNIUyB0
         xV7o4ZVfSXl+G8gXdOtiY7Qnnhrp/VpcvksfOXSZ3graTScK7AUTV1RSZXZ4Wp5SS9gY
         W4Gmyu5GWM8sJ2zUjblTa0cfNFMVLV20B8NG4IDnqPSm4nkl26T4uMLCTbadWcuwlmhz
         N5ZsLfDwwDk1kuieoh5knkWZlTCR9wNcE9l3OGWtiQKee86qdqRwEQmiCYfw20hvk1Jg
         Sy0hdqM0Es39DsrNCZ6J4kcyv67vipCR5Q/WqxNF18hHwomwF3k6DZ3bFXQph1TFvcZ3
         ZUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506919; x=1764111719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=siCp5mFpWwfh1f8xwoxhUJ4/70DgOMe2vhrDsZwypfM=;
        b=mCtOT2ZyYaP+Ca2VtNVuZHZ6YVpkz+P3J8iHdnIwxm3rkiAsV7C5amEuTlYrszm7oo
         rpz6PJBKJWfyE2wZE3oQxzTmb+dvbM8q9FLvC0OByu0dcUWNMLrbFgWuSygds29sX+F5
         7S81SEY89bY6kjI0IBpdHtUMZRv17+riPtArOXEey03IV8+1CSqe7Jhi7GpMPE4a1jTA
         lNx4+zQpzLjOeyKW3hJIvn2LgMmxO1vaaFTJOEhAUd9vi1ixqqGMp9yb+gNJsPbL7UDS
         0WJA362LgXDchFVddIJnrbH/1fnnl/uDnHjrctlx8fTPxVCVpYlH9rQooWSUjHjE2iiH
         CGZA==
X-Forwarded-Encrypted: i=1; AJvYcCULsswRRpfCd/rrgjD7flfE/JGIB5qzOE9jjymAObUVSzaf8imSovigU+9YEnz9lV4+T+Uol5oXg9PM5kxKaJP6Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWxQ7ePaAnCRWEf2ZKdaqoJF1EM7yUeXuHP0LPNIJm9A6uF7rY
	Dwug9+AvngTFKcoX+uVxJxMMlWiTugd3md2XKRsaoPTU8YA5svX4vtg7LR+V94ao7W1K+4LfNIu
	nnIDnkKuqkNNr0A1hXskuRvfg1Xc49MpUthXwYayhVQ==
X-Gm-Gg: ASbGncswTqwhTA7WsK0Kcnuy/gcUrpFZ0Y9yT1aWwr0bkwGa51aAxVMliNtxWA5arWa
	wGswpFESMhgQA7vUb0MyKqkfRKvNUzS/aFS518cUXHy45Kxv+W0mkj/DZm9ypjyt3RwZ1cKDwLb
	JNnmDmCUyBDDb3VVd0720o/uwQ8G1mGGdM6IiUSL6W1e4NvzX7ld5rhfCxs1qkr0M8uCMJvbGpN
	KAl7fRt1Eqfr6Qh0eEXe2AD1/bkeWgUZMEEpkrs3Pdz30IGgmgcNJjwN2thUuxh9lQ6s24=
X-Google-Smtp-Source: AGHT+IFkIfIZSGXlXoHdIK0KxF1Ui+2gjebf74KqceRqzx5hm1mFEKojViTBDgnakclLb8RLYdMH4dUUBNlg7Kq5u2s=
X-Received: by 2002:a53:acc2:0:20b0:63f:b60b:a90 with SMTP id
 956f58d0204a3-641e74a5310mr12151827d50.11.1763506919194; Tue, 18 Nov 2025
 15:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763115734.git.geert+renesas@glider.be>
In-Reply-To: <cover.1763115734.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:01:29 +0100
X-Gm-Features: AWmQ_bnLRCROBXkURxehco0x0ro3Ovcsqk2h9bGYLa1bbfJsRmYC9f2E24b3xwo
Message-ID: <CACRpkdaozpZdmbN=qYc=Y76TS8o3QMgqb2pYH1k=iqGYMfcYww@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.19 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 11:30=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit a5fad3aeff41f89ac94230d66ee5f9c1526cb3=
ce:
>
>   pinctrl: renesas: rzg2l: Remove useless wrappers (2025-10-27 11:53:27 +=
0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.19-tag2
>
> for you to fetch changes up to 3b0cf6ab35909d7ac8d561e18159c62d42d914c2:
>
>   pinctrl: renesas: rzg2l: Refactor OEN register PWPR handling (2025-11-1=
3 21:21:02 +0100)

Pulled in for v6.19!

Thanks Geert!

Yours,
Linus Walleij

