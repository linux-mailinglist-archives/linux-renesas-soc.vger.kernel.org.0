Return-Path: <linux-renesas-soc+bounces-5819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED28FAF38
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 11:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01F82284A92
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 09:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0C3144315;
	Tue,  4 Jun 2024 09:47:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BB143759;
	Tue,  4 Jun 2024 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717494454; cv=none; b=MsVXPAMtjPah8XtKU5E4gkZfudMMekdYFfx8Y+XCFht8Gggqo7U2MNI/91GCCY4UU0hvmiQ3tOQByiVTBbwUhwjzweX/Rq0DN4Mp0X3mFqAklubjA0NEi30ilK900q33ehYJ8l/jR8bYOo4+3BhmCsyVQkl7uPxtNkRFmKr48EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717494454; c=relaxed/simple;
	bh=OEufR6/8faseQMJx5Ixiz7s3gGBu3POWhXuFO12hUeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTrvjmBp3ncKYy1NqCU/mrcH548FRkJYvFEWWBLn10EIjiND9Us6uzVRpvFO5lJaUypaPnCG7AD9I9rp5QFmCiU0jWsnmsDQJuUvYCRq0AFIuozgNNvG6vqUDvgRt0CXbTnczI7NTWnGj0MUqsZPSjpeuNCA0PZNTzvStASLNX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62a145e0bb2so52226667b3.0;
        Tue, 04 Jun 2024 02:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494451; x=1718099251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+oKHPrJgjbF/4q/2kBiakgUjEI+vsefZYNEk/XcXYA=;
        b=b0iSrGdmk60iTOgwgDE/Vnq4NVEpXIofqobsy1k0PDHgdnoyuIt/lFkyBIZZkHmB3j
         G9oi4+aiFti/nnHqInxSETg0X4DmVm1j8d3nr0gw0RJ7Rv6RDObeZ6kj549u0JJ7WUQn
         c4ROhmNiPYAbtVbEKlz54KhTPB11K/rg2Z9TyW0uj6XE4mSqkGlqrYUyGwfTZJP/y6qR
         OOnoERtOiZBKvr29cEP0tQIqV4bKBUJ5YlZGh+PRw6D4yuYaKZydbJbgr/Gawy2INYi7
         4ogcGZViuiMu2VKHssfBjGO8BDdWlwIEVyu/O1bFzp6guSylA9mpb2mK8hJoIjpWUTax
         6UzA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ58YbsArxst4gKDiqIE87F6LghAwid0IM0AFEs5RNIFdf0XGRfDv2sFUfs/wr79QlbiXvK5kXue/Ky0zrm1U7ls9CSiQ8BKEuuZ4u5ulqoygeXHlrKSRUSKO1Z0XJXbJ3I56U8k4Nsm/xxOCU
X-Gm-Message-State: AOJu0YyGRAnaFOv47uYsMmPN+JgnjhMiqL2Od4nW/pmtG6LlMsh3rDD8
	6PJr+Lbo7yuPr+NDe4IHWCxfyZS927cUuEnufLJVyfE/+qRd9cCu0Z4WkoWz
X-Google-Smtp-Source: AGHT+IGJVoa92ZV0lUVPbQSCUT2ZZ4DRmWVQCq4GnEHb9fhnn/8Hjl4q1DL+zdI9fYiHBWpEU4XCrA==
X-Received: by 2002:a81:ae51:0:b0:627:ee15:a92d with SMTP id 00721157ae682-62c796c35e7mr124843377b3.19.1717494451014;
        Tue, 04 Jun 2024 02:47:31 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765e6d83sm18033317b3.46.2024.06.04.02.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 02:47:30 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfa72c9d426so4186439276.3;
        Tue, 04 Jun 2024 02:47:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX10PPXdzip6kr9KULJ642b4vK/wDLX9KA1/X5//EM+E9HsSdnzmY1ndPjsc9GIrpGuQJ703S/da0HGy+vM+LA3WGBcNUERltiV2OeRYO9BohKTfxrsWHcugnhgQVjuG4DKRF7qPjnSC2epOxMF
X-Received: by 2002:a25:bfc9:0:b0:dfa:ac81:38eb with SMTP id
 3f1490d57ef6-dfaac813b3dmr3745757276.27.1717494450714; Tue, 04 Jun 2024
 02:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se> <20240527134129.1695450-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527134129.1695450-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 11:47:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVhTk-BOL0z19LF5YbOcQK5ZkwarwwEZaArWnZgEkszQ@mail.gmail.com>
Message-ID: <CAMuHMdVVhTk-BOL0z19LF5YbOcQK5ZkwarwwEZaArWnZgEkszQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: gray-hawk-csi-dsi: Add and
 connect MAX96724
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Mon, May 27, 2024 at 3:41=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The sub-board contains two MAX96724 connected to the main-board using
> I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2

There are no CSI-DSI sub-board and main board on Gray Hawk Single.

> and ISP) that are part of the downstream video capture pipeline.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

For the functionality:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

