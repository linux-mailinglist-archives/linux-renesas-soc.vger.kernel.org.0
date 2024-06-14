Return-Path: <linux-renesas-soc+bounces-6250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2255908B5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 14:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 426912830EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 12:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4907D195FEF;
	Fri, 14 Jun 2024 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6e+MIqG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E917195F3B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367282; cv=none; b=KpLeeLa5VGb+u7vNby4N6EV5kuIjON8BA6iGv256+0Q9CqvIPnzGu8Eg7upofQiUpby8zeHUddU5/Vs0+xd0Q4b4fvnWsbNq9yTJ3q+YBCZEia0msC1NtIz54iOWLDfz3H52oJQIl5+zjhwN2aBilm9xHsAuo7o4PlwcO7PJyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367282; c=relaxed/simple;
	bh=UeIz4uU4kZAhCILh2YT+bY1os8za4dxW/SfvNJ0sd/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jba50Urgq2dzR+SX0YstM/IQUv+NMPrA5fTGtJtvMU6qdeEdyv1TwbBpNDws6p9fkI4w7AUOSH466gZ4KoYtzbtGf/+/nYgzmSkRiTK2rb+LW0zZW+/eOPp0fRflDP5rjYiLaAlMpc17NkOFOxk+JHpWq+OvClWfHvQ4423y0Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6e+MIqG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bbdb15dd5so2491148e87.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718367279; x=1718972079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeIz4uU4kZAhCILh2YT+bY1os8za4dxW/SfvNJ0sd/U=;
        b=c6e+MIqGUC0Viwf8qStWLKm+KW0JHcw+e7FjluKyvpA+Y6VWoXq5imyudd0sT0xe78
         70a/8omNLpgoxKDoiQXQplH4Hwm9DC0+zn3+VQJG3E+wGl1ZNqeV6XNqMWtUtWSCsLzt
         VsEFkOVwLafWx5PgZ9a24kU5udruMzQLtcAydsV6RNVuQcTzi3YRDZ/oSPIGCDAKm59D
         pRgrtOob9DGtyocBfA8mJjK7IGTQw7/McP/PRQ+yHQIFbUX4pGPYxIY9ocMJoiD6H6re
         qEyyQTOB7sS9p4jrFKFFLjhu8m7IcDy/nboEt1ZIBoT1/O2+nAq7bCeM/B35SQu1nVe0
         mtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718367279; x=1718972079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeIz4uU4kZAhCILh2YT+bY1os8za4dxW/SfvNJ0sd/U=;
        b=O0A1m/fM+ttmH5BLLhA5GhVlp2QQdtLuBufPWR54UKtsNWf5/Rw3TD64TtW/0ZDZRd
         GlCW8HXe5ZN4wMdAwF97mcKIUZ4Q+CftoAGiU48BvdldR0mhK/uJZBzs/S5GstPurFUU
         KSWqKBgX7xufNIuX8wG8hwXc+yDmTWwbEqKckBGH814KyKmCu0HCtvVwI7ibp9qNf7CB
         hC8i0Ncq/8R/ZD9j6Y108D6xMla2x/ge+D3OINJMSHFFi8gRet5NSv022cFh+M8SoXXz
         2uxK+uA6/bJJLZlMheOtpYID3g8q21RFGH2LHeuE0vYcztf+gNOmXowlcr+rjgT6F5bx
         sArw==
X-Forwarded-Encrypted: i=1; AJvYcCVcUpXviJreJ0wxjA4H2OCmlSJKfKdNLm5gjU4DT9UUx8whHOuNxfk5QsHDxUzTKWih2gY6HnuO6yIou2rOHJ3KsEroxUy1n8xmHOZOifZbUfk=
X-Gm-Message-State: AOJu0YwuzBFa/gVXYZK9T4/9XAOluoIKVGpaWLyWWfe0twtwsM13bVCB
	ExVlNqFB8Sg84nENWfcomrxESFVPQyrmUGTU+PQbLSXbN2/jOpTajVaIHQeY13pW381OJ9cQ7bk
	Le9NS+XInMppgMz1VL5xFDO6rRdprj73A3EBB+w==
X-Google-Smtp-Source: AGHT+IFaxCTVrnHsD0s5raeXhDL6tWd0FwAoXnrdVcIz+EXgoHNwqTOyJh6q+ZBvtPjCY+PsQDhhi0usOpQGjDVCmoY=
X-Received: by 2002:a19:9107:0:b0:52c:9d68:7425 with SMTP id
 2adb3069b0e04-52ca6e55b90mr1516079e87.14.1718367278806; Fri, 14 Jun 2024
 05:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com> <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <CACRpkdYtLDA3518uSYiTpu1PJuqNErHr9YMAKuar0CeFbfECPA@mail.gmail.com>
 <CAMRc=Mem6HN13FOA_Ru8zC-GqGGLTsQiktLWs5bN4JD1aM3gHQ@mail.gmail.com>
 <a7463c6e-2801-4d0e-b723-fc1cf77a04ed@app.fastmail.com> <slpwvai5q24qwymh7nktihvykmlhi5j3nhqjxruxb6yacruu47@27b7rhykw2f3>
 <3bb9b39c-c15f-49e3-987b-26cd47e05f3e@app.fastmail.com>
In-Reply-To: <3bb9b39c-c15f-49e3-987b-26cd47e05f3e@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Jun 2024 14:14:27 +0200
Message-ID: <CACRpkdaC6i54qUfJ5H16m2wQhR89bXq26Pn0rZ-80m3a60-_mw@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 1:59=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> Of course we don't want to make it a first-class interface
> because of the reasons you explain in the cover letter,
> but it would totally make sense to me to call it a
> debugging feature of libgpio instead of calling it a
> standalone driver.

I second this opinion. The logic analyzer does in my mind
classify as a GPIO debugging feature. Surely someone
debugging anything connected to GPIO, such as a key or
MMC card detect or whatever could use this feature to see
what is going on on that line.

Yours,
Linus Walleij

