Return-Path: <linux-renesas-soc+bounces-12227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE8BA154CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 17:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31DD4169DD9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 16:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EAB19F42C;
	Fri, 17 Jan 2025 16:50:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C51991CA;
	Fri, 17 Jan 2025 16:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132604; cv=none; b=aZAP7JNPYWZ0fhIBzmqZaeIISF2lUkMB7BCjUBxYVguInPMMvvARRr3kJZcB0mwkSq8gVtUFnfDPo83kMBGlR6MvDSzt1ODlz65prf6VhnKy0Xuno6FNtbz5j2VlvYPhKCb1gh0P1rFCWHpMFRURqEACOrh2Hd97ruixX9MGQaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132604; c=relaxed/simple;
	bh=XQc6H9I63GSUIvvaqIkwjNxTXWYGAoKDp6NYz5XwwR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5A7ZI69Pkag+SD6TjQ2bOrZ+s6I5dTkzysN9h2irxgUbkm/80k8MmDOy6ETMCEU8gc9GWlsKxxf5eOEHILZZmc35O6KAVfaq03sZJMbvPU0JYhTTtFoZsBoeH5iJ3PLvl8XnrPpt5EqSa2DgeLY4eMtvyDuSmao7MryVpVYBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso1573772137.0;
        Fri, 17 Jan 2025 08:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132601; x=1737737401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkdQhOJEfjMMK9wfH5bIMTpf4A6fxgsD+bAY7mnl/B0=;
        b=vkWI+D35JHEaba8nWOVY0qyVil/nep1Ilg/to6n64OVpjWhD+iQNCh8s6LvYJtNo67
         PU1kj3TFw972AH/I7iVK7Hy8VSUtY0EDITrq/I3heUxhT5ByhTvzdobqhqSdw6j7ykt1
         3sPdum1pnAjNvNZEkQ+5PIm/NXL3+dp3pt6wmOGPY57X9ZeoBMwjcvpocDfrB/RMha7T
         5Vc5PZkh1xTGK2HwiQ9Q6hICsJAU+cn7WczXgsU8L/qTasS4vXPhHRATXKbTpc1iaaMx
         SWhnTbscijWRDhgR6Nl3DpWfY4ZDL6fyEFIe8cqSrS5yYz6Fs8e2LEAgl9UyqcfE6CxO
         XhWw==
X-Forwarded-Encrypted: i=1; AJvYcCVV7chHetdhyBTfLOKM7JGYaQPy7ZjJ8eeL9EPu+Hy7koLUXfmR/x0gAmM8jEiSeO74ePoL/SmZknQJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy48u+lDVqFgiiG3HXduN5YlmNVLGsCYgAfjKL125rDiScnd0ZE
	hKzMFFGx9Nr3sVKBwYkrcKhzRhtx2NqjMDmAOU5sOfzZvg55M16EllMd6CUv
X-Gm-Gg: ASbGnct+Ro0K6XfNTdvolnQyGVfFejZM5chl+6RpilM4WdNDI7cN86VEGe6SZ5ayO8O
	LOewSGqh/u3UZLsfXdAcAh8gR3NpE5HrIM8g9H7O9lU4y8JyoI4ZrClicqW314eOVkBTECiAH3l
	D5nt1ZDV2JkMONYWVddAZ6BCZdMSyWTiXYDoZYFTZminZLepEhCQsQUooG4yAI9d3Qj44uBmmt8
	jOes3+kz4fC8ijb0hJxhI+Gx5FzYm1R6Fz9HCgzHA393/pJejZeCN8jJCrhy2l7AtHgPkC1UzHk
	W8yvaBuMWh/lohD23ys=
X-Google-Smtp-Source: AGHT+IE2snPh4oLxulsCWhJJKc+YHKwjhQz6ZMnhX5Y7mdzKW6B3J7/dJ4zbaAsm0SF+QmOX/dMt/g==
X-Received: by 2002:a05:6102:2923:b0:4b2:adce:bcfe with SMTP id ada2fe7eead31-4b690ce307fmr3142805137.22.1737132601165;
        Fri, 17 Jan 2025 08:50:01 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a20863csm537814137.9.2025.01.17.08.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:50:01 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b63d564e13so1264027137.1;
        Fri, 17 Jan 2025 08:50:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpldciXke5imUZ1APHjCBzUg6yEVL5Zt4568qti4+/58bZdKI406FtmhNIUyD+AUA854q00pnq0PIK@vger.kernel.org
X-Received: by 2002:a05:6102:2b9c:b0:4b6:3e7e:ee48 with SMTP id
 ada2fe7eead31-4b690c775e3mr3958440137.18.1737132600834; Fri, 17 Jan 2025
 08:50:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115181050.3728275-1-niklas.soderlund+renesas@ragnatech.se> <20250115181050.3728275-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250115181050.3728275-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2025 17:49:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQD9iGEdsvswy7GeHfSQQdCQ3D9W=aph5FWUeiss5jyQ@mail.gmail.com>
X-Gm-Features: AbW1kvb3nxhi4SOFqnaAjV3TbYYAl0gajPt9QDx4vB0WkJmQ6XjvTgblAKq5RgA
Message-ID: <CAMuHMdWQD9iGEdsvswy7GeHfSQQdCQ3D9W=aph5FWUeiss5jyQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779h0: Add VSPX instance
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 7:11=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device node for the VSPX instance on R-Car V4M.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

