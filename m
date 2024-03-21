Return-Path: <linux-renesas-soc+bounces-3966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B3388598A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Mar 2024 14:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 871971C20D45
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Mar 2024 13:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD61283CC1;
	Thu, 21 Mar 2024 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibXWWjZP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5285474D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2024 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026390; cv=none; b=uAiUuVLtL1qCcSWUAsR8gClJiVzyT3v8nTpgB4jSG5E5b7N4XineDDlrRwm2cgVk+mMNdqVqaCZwZs1U2pSQiVVwpfY+fqLsKGLNDbReGBmPr131W871BvvZGzrx31A+plfV2cvDo5LIB4RIvND3xrQYTlOyrmT/jRsxg82TRPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026390; c=relaxed/simple;
	bh=sG1MaGzo9m4QlKsADNwmAvZyKParCmSBxrNDh2dDZRg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=L0NERD91gYn3/bgg3jl+n3tXg/3U0L7vEZfhgiL2ZkYqZMPINQoz611YClmkZ6cOXz69q4FmRtHtfO6AzObQ4VwLqBkr/jG3B1TrC7/SnQPj0N1wcdsttyh+MP9ZVEouqoVSjHYqMvxblFyl3Wiz1aAQO/X69euDul08XXQUfcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibXWWjZP; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4d438e141d5so557083e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2024 06:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711026388; x=1711631188; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sG1MaGzo9m4QlKsADNwmAvZyKParCmSBxrNDh2dDZRg=;
        b=ibXWWjZPf+fpG4nhos51YWeGmQGI/82LM3a10k+o8SxK1lpK5BBpu6sXRr5LC0w43a
         dNuH4rQ1916Hl/r8U9yRLugDOAnnQ8KJPdokLtswiqmfRMlSflqcjUx3EwRUCDrveZS7
         Ts8VwW0jyBrofY0CqwP5WipWMnmynMKTa0eNWKQsma0XJFhxRHcC521R9FUf26CRfzlg
         rutIq4q+0yIDw2dWQGrJQ332uWHdpj0BIqr22nhabC7ZoWCQT/TtnZrBrYDIDokxydWE
         i1qYU0ZGZjOElk9r/X9SFhqP2Xalcr6nUoFkoUfehzeUsrRkhAQMAZ5LSZc7/5k36Iku
         47pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711026388; x=1711631188;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sG1MaGzo9m4QlKsADNwmAvZyKParCmSBxrNDh2dDZRg=;
        b=nxvYgogfbCvZQWUPblKn5czjpmNx+im4CKS91T6oFhuWViKzZOEI4CJsJ1vAmp+9VX
         XWOSg9sE7ZeyWwOcS5uqD2zYfIO3LEXr1F8edGkAXbPrCzHjvK0RWy3TyIthX2rVXcqb
         h2eELhfF0xJfkXm9Q9bVpNrUpbpgatjW/R1ak4j3JUitgHe6tPrKEL4s1o+ClfPs+4Eh
         MW/eDdQUvz+0v1ExE5NI2NFOponzROL7ZEGyxUCmtqSZNfEgsK0JW2qeZQgyNYpEVz9w
         BVKUDmMpHBLZvoww8fClhbsM3v/ZROGZUFt4vs0CeWkjL7b1GJofHPEe97lrUGod64TG
         ffEg==
X-Forwarded-Encrypted: i=1; AJvYcCVGhEKjhKc08hXbZOJ2MeZnSoUC36d23Zi8JHDCy1KpxDmHR2jRoYBuie5fmW3eWydtIDGmzBvLZCt+7YWadPWqpdIb9PoUxw03GkbYySOL7zw=
X-Gm-Message-State: AOJu0Yyd/Au+h/49kg4ZSC5D13mlYfuHGnVf31NlH2U2d4WN213lklr+
	405Mjocd0Gtvzm8fc6ax1XRCqL4ZTU6e1amapAUYzuVdFJwIDqr02YnCwrK3lYp3AG/beQ0XDxt
	k6Ybgka8YZqpYESTl6/uMEnjpIDk=
X-Google-Smtp-Source: AGHT+IHu0nJkmkVai4l96u86pYJuCrK/8IECiqdCnHgGhDfFNy9ugpQSVd7PLDQ5mkZ47D+IxaRSAkJ4R+/WENyBtx8=
X-Received: by 2002:a1f:4c87:0:b0:4d4:34b2:9a89 with SMTP id
 z129-20020a1f4c87000000b004d434b29a89mr1612452vka.8.1711026387902; Thu, 21
 Mar 2024 06:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 21 Mar 2024 13:06:01 +0000
Message-ID: <CA+V-a8sBVBCjPxeFjZC0RQCqhF6kdMnp=KAWF+hdsOJUPCPo6Q@mail.gmail.com>
Subject: [Query] Reset core API
To: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

I am working on the USB2.0 IP block that has a USB2PHY control, this
is mainly to control reset and power down of the USB2PHY. I have
modelled the USB2PHY control block as a reset driver.

There is one register bit which I need to set in this block depending
on the USB channel if its host/function. Only the USB PHY can know if
it's a host/function so this somehow needs to be propagated to the
USB2PHY control reset driver to set the appropriate bits. The current
reset core does not have any api to do so.

Currently I was thinking of the below (yet to implement),
- add a new callback in reset_control_ops (int(*configure)(struct
reset_controller_dev *rcdev, void *data);)
- from the USB phy driver get the reset pointer
- Call the configure() callback from USB phy driver

Can you please let me know if this approach should be OK? or let me
know if there is an alternative way to solve this.

Cheers,
Prabhakar

