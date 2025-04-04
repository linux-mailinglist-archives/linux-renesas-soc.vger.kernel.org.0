Return-Path: <linux-renesas-soc+bounces-15393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93599A7BCB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 14:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50E963B5A27
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 12:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332C81CDFAC;
	Fri,  4 Apr 2025 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfgHX/Cr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2F194A59;
	Fri,  4 Apr 2025 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770018; cv=none; b=hlQyb4/1f2WNFY8W45Z8TwgMcApWmGz+5cNaEyfmkTb07QxdmE/BcZZikj6heYeTfy2x2a3S4qOkXR7ioz7VZhvEbXEFlRVKjpNdfmOe6LJgjP4yhAAt3sdpJLWWmEZFtsyEJHq9uUZRUcvBKZp6Mh9OtU8AM3BWLOMx7ozNKcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770018; c=relaxed/simple;
	bh=1q9Xs+jygUl7lL7eBus4X4Ywz+yFQz6iiIpGWm+5nlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y75USRezE8nt9HA2C8oqfvdfrRpeqkw5FWrs7TuzcDsFT9RkIsP7Tedtygq5PdZBflV342bdoVQfjm/I57VLHhbmedRmP2zPsPBaZJNb0kmg3pY8aKsyOV5G4SjE+z+1/HAHIoKphjSoUQUvpKQvY+G2gkLvDitwdPn5txpG76s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfgHX/Cr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93526C4CEDD;
	Fri,  4 Apr 2025 12:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743770017;
	bh=1q9Xs+jygUl7lL7eBus4X4Ywz+yFQz6iiIpGWm+5nlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jfgHX/CrTu3b4VDI9XSgdj0Viq6Dtgdu2IYlhcQRd5CKtDvg4rqM2OP+Xx0sTY6BU
	 0HjeGN9KZnHO2yEKuHZ9/hrf66zhtqjP/tMYHEsRMKNJ8AaQVyrR8rCDxdXilNudKh
	 OJeFCHos+ZIGw/4iEVWivi8Z3qTODYGFgeDuuMqXBBUqCm3r5CSmizgwqz+XxRxylm
	 zRX/9efjySTaODGXUdPG2bozAU0+kp9+0+xiF2f5Il/2yvWMhoTny8nN2Se3JV++GZ
	 F+JmfEUzHPyFAgvKQOXwLcobPU3Xm3IHexTQKfr0hvArFyL7dkHGIHJZvqFhW4SzBj
	 z3Euo7D/3RTAg==
From: Lee Jones <lee@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
In-Reply-To: <20250318091426.22258-2-wsa+renesas@sang-engineering.com>
References: <20250318091426.22258-2-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH RFT] mfd: aat2870: use per-client debugfs
 directory
Message-Id: <174377001632.304782.11212000146213993361.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 13:33:36 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 18 Mar 2025 10:13:41 +0100, Wolfram Sang wrote:
> The I2C core now provides a debugfs entry for each client. Let this
> driver use it instead of the custom directory in debugfs root. Further
> improvements by this change: automatic clean up on removal, support of
> multiple instances.
> 
> 

Applied, thanks!

[1/1] mfd: aat2870: use per-client debugfs directory
      commit: d95fd7d697a88c6da80b57c8fda9314cf1d6212c

--
Lee Jones [李琼斯]


