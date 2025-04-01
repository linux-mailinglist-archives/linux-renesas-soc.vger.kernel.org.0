Return-Path: <linux-renesas-soc+bounces-15238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53229A77A17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 13:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BAC13A0575
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 11:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB661FBC92;
	Tue,  1 Apr 2025 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCWmJsDH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E71F3B97
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 11:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508351; cv=none; b=SfxXV2lKjzjYLl7B2U72ZH8qKDvwln9+Ld0GG4XZUXsL2qgRXtQrXsurNw6jv5fwjoXaMQ8kxA7oB0wPHHPSc5SW1LgW5G7zg7WQCOpppBXWL/v+NAkBe0WmAsBjp/Q7+dRLBdF0MqdlVwNFhZ2yEfurgO3pjn8Az0DIGNW35DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508351; c=relaxed/simple;
	bh=5yzItQ8LqgsxF/Z/FOtRoqOr5/8mxxWTWVmuv/75QU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=J0BsuXoqEE2d1QuvouEwm0nN9+SWELb79GkdMckgSxi+AixRshJFfxMPvVgg0tmc57eDT7rl8po3wsgj79qu8yyGSUih91lXTHWZdVNU87Sr7zvt3rJw0Hw3JwLqIbQIQPsKUwbwP842Ddklaw52avT1dfkdTisPwbg4U+hhOGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCWmJsDH; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e6deb3eb7dbso116689276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Apr 2025 04:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743508349; x=1744113149; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5yzItQ8LqgsxF/Z/FOtRoqOr5/8mxxWTWVmuv/75QU4=;
        b=YCWmJsDHlUQxuY1RTTB+LDulZHtMdOhIPDoT+jy8nl9w3nWybIzv4Zr6Z9QgExa8yx
         mXuaoWRQdor5DbyZus15LbDq46tnVQYi+Q1NgtvZGtZhVJbN/oA6FiRJkjAmeKvVUsI4
         WeD76VV61jHg8sn2ppt/8IC+IKt8Q+ThZz71BFG67HJIShVkvFNP8vydITc9RxW4jj8U
         urX7NVWBlqUCGWxukRHhuWII0enMGQekApRsnUVVZERC1zV4ASLXyaZ2ffkSjTw7XN1m
         tjnfX7dNVMFHNtxg8ZWqVqjfXjLVujOmfcNCu1BIkH42i5LHKp9jljjINi7D24XPtQ4M
         FDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508349; x=1744113149;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yzItQ8LqgsxF/Z/FOtRoqOr5/8mxxWTWVmuv/75QU4=;
        b=thuQGRkR4+uyiDl0dL/g1wDl8j2r1jQrY02Iyh23MtYKxzgD8QqqYF0QQ7G2vzf3FS
         sv5elGmbsUz6IqEQuP9HEIXJo4xth/lNDqgp0O/vbZfMpXKXWAyN9DjP49C+63k/H2fy
         0zg/BY85EDBZB9LqJWRqZZ4SQLxwHCGJ1ciN8Zsav5jDUeqtYMTwZjBpl4+j1B3QnZsT
         p/Y1pRwH1NDiIXCvzhmZMgJQf34ovPLHBR6k3kgOC8BbjXJrqNZ1QJDiGrXOgdxEkSVk
         BG+B5poUWpIRXvnxER6LnS8BQtKBIaMSEg7nrWh5eHMCJLslPq5xI9V8ERtN8M46AWxW
         ukig==
X-Forwarded-Encrypted: i=1; AJvYcCW/cevMnQ5ePAEEthNgGb2LSaATOq/5siBE38ykh/ROmrW0920iqgslbetGl7i5WZXylrlPC8hUhZJ8uS7xcxbidg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkyltLiFASJSMIqaDZjfXt8PFeXpCQdmHiDO7PW84EIV46fnoL
	o20s29B/cwf9XkrzQN8zJv+97a8+y5J5sNIeoLmYKaf0i3PNRHo+YUQuJksYsxb7o40ptPXMgrg
	NFMcPoIvmueGvND9TG/sWppTTZf+KqNRGYl8ovQ==
X-Gm-Gg: ASbGncu++FjRt+LWmG/hBhSiS0he2YdEDlyz0Rs2OiJZTckllaZo6/gvXLjnPIiqfYH
	V8bCnfOW6Kr5abW/MSV5Uc9hj4qvlDC/YtfkSnV4gOVxDIPOIQ8TrHrHVJgsqxbI5fvzMX1V8Gn
	KYrbuoFBeWBxgDjSPJEaU9sgvXkPQ=
X-Google-Smtp-Source: AGHT+IHxaEOwFTKWaB+ZSBcVAKNOPJ8aS6UOQcjmnOX5LqFicwu/ZfbZg7gfUlNZSAkuJ5/12Ji7ZaV/z2l4CYONuRg=
X-Received: by 2002:a05:690c:6706:b0:6fd:3ff9:ad96 with SMTP id
 00721157ae682-70257302fe7mr178667017b3.37.1743508348824; Tue, 01 Apr 2025
 04:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-6-ulf.hansson@linaro.org> <Z-pSq5e9MXTX3qfe@shikoro>
 <Z-uou73DUQoceMj5@shikoro> <Z-upJTp3ykMqvSAl@shikoro>
In-Reply-To: <Z-upJTp3ykMqvSAl@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 1 Apr 2025 13:51:52 +0200
X-Gm-Features: AQ5f1JreKDN8MR7O6t-gHP4ZYjEMdyeapyJn_AtqSCQXCxMcjN2-RxnBrWR5pKE
Message-ID: <CAPDyKFoc7kWePb3SvnAHZDBNnpiA5Rmccgh3OufS_gSSfNbJrA@mail.gmail.com>
Subject: Re: [PATCH 5/5] mmc: core: Add support for graceful host removal for SD
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 10:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Which also means that I tested the whole series on a Renesas Salvator-X
> board with a R-Car M3-W SoC (Gen3).
>

Great thanks! I will send a new version addressing your comments on patch2.

Kind regards
Uffe

