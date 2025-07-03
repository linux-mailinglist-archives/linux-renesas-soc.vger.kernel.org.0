Return-Path: <linux-renesas-soc+bounces-19139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043DAF8348
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 00:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 534965836CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 22:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82251296153;
	Thu,  3 Jul 2025 22:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMKXOHQ9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C842BDC2B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581415; cv=none; b=ooizhlebpmlL8IVA8IRqivTSsaM+/HU+tYVNbpN8nZLDhXNVf52YFpPYqmpQvm7eJFkL4D3tmNoFNOPBCMQSWr3NQFq+qdBKesafHERG0cczkFf9gKhDmsS+bJ5XBEPj2J64RiHQ6X6eA5H12kS/RCJGvaT2vX16uWmDsk2DcUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581415; c=relaxed/simple;
	bh=+9b3dl/FnrbO3AEWFum3p+DcNxWAymfUt7t9pmXUYjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+vAQXo6f2OeyM4L3T+9A7l9kvEwv6pMUImhdQXWZABxG16yKIJCZPZYprCPZuK/RXK67LQU6HQ+2KumtHXaZ4GDvY41NJP+7tiPI5InTZpNMaVdNz9wY+JYs88NnzWK2CTsSSfI/iFV0BtuH91TtCeeLtNoGYQn+gwLCJWQ7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMKXOHQ9; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553dceb342aso356760e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Jul 2025 15:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751581412; x=1752186212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lakJBDFUf2pBj7S8r/OJfnnpLb+hUbtoo0WYJVudH0=;
        b=GMKXOHQ9Mpw0RJVYchIdfw5uXhU+eqt+8Im17nTrspOnY7uG4vNjKxES2sPxLqnwMw
         nGMsfhgJAfeaQR4UNl5sq1HUKMPoML3fDq7RrWeFImhgmRb3Hcr+4uJIBDpTNbIqgtpp
         z0Gi3/orDxHWl6lq5CoPGICW7+K0zvE+o6HHn5pWrQpO8uHF81hK9xgtxLn6SfQCEFa6
         fXlTMLnLYM90j8txtuD/DFfXAOIC2APRGhiNE0Exb7YYqhd7i8MWifGn100y0zS8e5Iv
         XJzVqtBe+m4Iutx8iMkeL/6BXBPq7iZx3V7hzqBE6yp1DSftPcRFXirT8TeXJ8e/QQWx
         TXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581412; x=1752186212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lakJBDFUf2pBj7S8r/OJfnnpLb+hUbtoo0WYJVudH0=;
        b=pZHlIPe3Rc/8PJv+Sw0WNO2mXlfRmy1dKyP2DmJ1EW5Njx+oB7QD4+Mzf7Aca9ZMB7
         i8JqCoz9GOO3CM0Z7375dgeYDtmARltV3GMUx/MeSyFGmMGa2+5XFLpLpn30BWIH4mne
         SoqIHbVPnvb48Zi2I8xvdjJkpRu/QmsUgTKV4VmcvonJRAAJgawyTm6wOWlFyP2+bmIs
         /v80ASSxATZXIUgDzNM0PPlXfRI+w5tIqiPPGOrPpRrjnn9qkfKadMezAnWWQteE2GFz
         D+er7oMeGc+JhSKI6Akiz6yx2+WSEcOSsKnF9uJD6pE5RXjJ/p4Pl/oGFG+1RJQcMzcO
         qZGA==
X-Forwarded-Encrypted: i=1; AJvYcCXDN19qAspzuTgUrKIszwe1Rgy3a1PvWZpLE5gCWP3drjUnsnvmLT0Smr3gDj+uL1RAdJGGTrNBM3jeRxrhaWXmjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPTzB4rjL/gaijheMxavU57J+FNJt8I1AMkYk96VczFG/2w8t
	AhIu5wbCUtd7erk973WJqExl4PoM88LvF5/TjBkiC6Ns5jELzULfcbU72RXZ+SJ08DPjifPik4E
	hUgsnScfDPrmWAZnFOVosZ2r/2NsIn0Qn8+Q08rRQng==
X-Gm-Gg: ASbGncsif3xCL2wjxfpIZ9ieCuVr1SDuB3nCpuOFq6QlRNZzoLURUECVjz1wjQhLGdp
	zRqAMHnA156YRqkx52SM4vQJ4VJVqXnh2SQxgG5dxzh6TublzmHgKhMBubnIgYQI5gE5xPbUxOb
	mXV1nXfUX167GUNJf4jAXhvveqXDcGNO13kbBuCBjeO0Y=
X-Google-Smtp-Source: AGHT+IFcu5kiSJAc83LlRSLtJunCwQOZcZjPJZyMODO9rBoWsvKHmpgw6FSCbOjMs/I6F3EuUBjn+iy/8o5saLLN2sM=
X-Received: by 2002:a05:6512:15a8:b0:553:241d:4e77 with SMTP id
 2adb3069b0e04-556e71185f1mr36708e87.22.1751581411905; Thu, 03 Jul 2025
 15:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1751027166.git.geert+renesas@glider.be>
In-Reply-To: <cover.1751027166.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:23:21 +0200
X-Gm-Features: Ac12FXytRiwz9qeSzO1M2ZHmN76TGYer3KP3gq63_ugOUIT52yhT3PiehWd8PeU
Message-ID: <CACRpkdaLyCowEg-PyTU_knuGbwBDxex=k8UD-1mz43g46_CCrA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.17
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 2:40=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.17-tag1
>
> for you to fetch changes up to 52161035571cd62be9865039b4be65615860dce0:
>
>   pinctrl: renesas: rzg2l: Validate pins before setting mux function (202=
5-06-19 19:25:20 +0200)

Pulled in, sorry for the delay.

Yours,
Linus Walleij

