Return-Path: <linux-renesas-soc+bounces-14079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A452A54CD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A34D73AF4AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864CE14A4E9;
	Thu,  6 Mar 2025 14:04:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A206D1304BA;
	Thu,  6 Mar 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269872; cv=none; b=Ps//Ea1dKsL9AeE7fIoAeN2864tqLH71/qDu6xtfhnvmuKi+5utYB/Rtgd4Pbk/+vj6DLDHlhELucfrRpadeu7+crw7JGiLAinT13VBJ+Ayj482PrSO1slw+jcyRPaEXD+CeDKo0OATlt/pENVn6zGmhIC/v9u1nUOBYE4EiI9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269872; c=relaxed/simple;
	bh=ihsnWaJWrXQ8Rw3BJDgIJH8wRf4rO5PQ3bVhB5xotzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIjio/lJBBkv19VXucIrpCANR/7gsJEE2r+o0aLvHGdUuXmYZF5hnqhR+70+42UPzix5DDhRecai8+NgNxqi75oHgLfxlRR7TOGrqBEFMFdZkns24sxd6IvlcBDpN/vr7RJ6l7F0CW224e2AgMdtOLkg5GHcGlTVOJYOGMC5EGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c3b4c4b409so107649685a.3;
        Thu, 06 Mar 2025 06:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741269868; x=1741874668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVN3i5PuRzQd5GnIu45kxsywYrlcAkKHUI5lcUWEDuA=;
        b=eHJsBKxlIvhpYLXZd6LY8ZL9zEDGuMDGNJaN9l8vGbtC0kc7d+JGapZyvr/tJpM6MD
         XKhgMDd52icbs8oUdxSS9tHfXe7HiUBV8VmZb0DM/M+TeZwQ4uCgW8g6k09Xv9ymHC9h
         oV6M7ym7gAs9hB8wpgAQuNA9l0bzgiNeTJDerVU69scDWgmxmUlXA4alNbuOsaZKHCZI
         ga4ePv4WU9X1pWpCaA9nv44ng1jvbkHoThpHQ3vbN/u2v2lso40mySr0jAVO8+V7+HGo
         C0KCCXBXYMdbjhdNFW+sw5622WsEoLTeVaNG+CXqXfAI8m0yVB1/+rIopQstJgL4mUFW
         ERsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLAp21LiqUigB1AZPx3+KV411275qV30eChf8R9sgrxu780eyCULZLMoRN2fnRIRJXxfPtfpCJ/l7s@vger.kernel.org, AJvYcCWX2WS0V7vNMuFeZ1XNCJctDmIaZhmkIP0R7aS90EEpm6N3y2IrvsD62VW4gC6XedAjSgK2R2SpqiaiCbcJ@vger.kernel.org, AJvYcCXikA1eSjZB25qK+vB/Qfi80xZ+GP6DYVgBBLQn7FKu41rvl3yr662Qg9446VYtgRcp2dKkDOzbgAAYmbcUZg4ikVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4rQRao/hWU60PYbllpivuIseKI0+DJHu5W9qewQ0Zd5k5J9C
	E6h6V2O+ElaqX++0QM7+JDmYTVWshq4vhY0LXBIWH7djzHmmNP3zaLYlBeVv
X-Gm-Gg: ASbGnctJ4XRI+uGf73YGMCQ/8MLeaEh2W7JpM+0C17hMIfOAyT3yrBQP+tiP9PYfgOj
	LOBe3mfxCRmw1k321QhnAogpDzyxC7WN3pdJtFNtl+ZS1oEtXQdlZtEvGdvq0Uwjjs9w+VPiFVy
	fkxZ1qkxlMqTtjgslRaJOgAWdYi0Cn72TeTy9mgk/Sy9wdZlHFwSARV4d1Zc/M4SuttjBs+to4k
	Adml9d1BKnsSQRVyjULqIkTr8w50Nzup0H14HtlC7oJH7kbQC5CJspK6ciGDACY5HNhLlTM3SU3
	ia0pMuQCQRR8WAdBGWs1+ggwzp/t24gKxnN6YTr0/iAG8DB9nQK9Ld7WFaDlRHET430/lpaybTZ
	vB+2aJs0qvpU=
X-Google-Smtp-Source: AGHT+IEgnUgiYt4gU8lh39n0ti6trL4CLvTO1Bp36gvAXnTs91f6QVEF54fv+5+jgHuwtxYjUzY/gg==
X-Received: by 2002:a05:620a:6190:b0:7c3:d280:a67e with SMTP id af79cd13be357-7c3d8e1f787mr1231923885a.7.1741269868228;
        Thu, 06 Mar 2025 06:04:28 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e54ff929sm94788085a.70.2025.03.06.06.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:04:27 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c0848d475cso84641585a.2;
        Thu, 06 Mar 2025 06:04:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfqwb7YaX2xINdnRtzJ6FDPfZ/UhsEMSq5qTZ3OkWVpPXg5LEgNJ0asc1sjaymdksAAmkZI7/YFE2pSmcen7fCtc0=@vger.kernel.org, AJvYcCXh+CNg48R68w8HTNtHn4BZZF5GpvWYmg0jFwvqU9u/ZZc8Toddk5o6so/BtchCWUpGForstjXat+Qi@vger.kernel.org, AJvYcCXkcaGGwJ/yweLqFrqUXZquDdw5n7DmP/YHUK21dx6DVV65sMETrnf0A5OhsukT/12wF/ExSJbft893QE91@vger.kernel.org
X-Received: by 2002:a05:620a:8082:b0:7c3:bdce:d1f7 with SMTP id
 af79cd13be357-7c3d8eec180mr1208781785a.58.1741269867178; Thu, 06 Mar 2025
 06:04:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250218115922.407816-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250218115922.407816-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:04:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmfcJCc9eMYZkROYOsXnwZh9QCNHFzsRKiV41_Jcs=KA@mail.gmail.com>
X-Gm-Features: AQ5f1JrYPsfu25PIeNIu60xL2O69zif9ZzXRhar4BbB7hfkcOwb3D_-DKEmgPEo
Message-ID: <CAMuHMdUmfcJCc9eMYZkROYOsXnwZh9QCNHFzsRKiV41_Jcs=KA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2025 at 12:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Mali-G31 GPU node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

