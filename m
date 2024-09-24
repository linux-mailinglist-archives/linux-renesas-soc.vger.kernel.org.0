Return-Path: <linux-renesas-soc+bounces-9018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A927C984778
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2024 16:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A6A91C209C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2024 14:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238C91A3AA1;
	Tue, 24 Sep 2024 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akDQbk2L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3D13342F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Sep 2024 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187476; cv=none; b=t0nVKoUqbgSPS8oID2Rkj7pQo98RTqn4rwowElJr4r7/Cn3DPT8DE68AnBVQUjkbH2RJF2vT5b0oS1aTE6BbYjFphfBAQ7nQv0XuOpepHk8rT81chl54EOAoOo+/xuv9a0bykeQfggf5D7tDbBZc5K7y4Q7dEZyON2mz5tCgpSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187476; c=relaxed/simple;
	bh=vBpZMPQ9rsXhtFubNr31yUMNqsCHeYd7iWTspMzanFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OnpAmukIBPZjUf/4jujKUZyRTPTqGH/6o9/Xc6larEJKxvRXV79joIEVY5Xp9mNVmY1t0TQYkxoriXgGq1C+egzg3LRMJEOiIJpZSsHbYRRICFgycBNvN9CLx8dQRO3oAlNiXHiyP4fxFtBc3kksf1Y9/n3hYoSVyGERN7zs9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akDQbk2L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8D0C4CEC4;
	Tue, 24 Sep 2024 14:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727187475;
	bh=vBpZMPQ9rsXhtFubNr31yUMNqsCHeYd7iWTspMzanFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=akDQbk2LK7KbJFECMGV3gptY7Spz+NyihBjXTscYNXR0ZDGHLF9Hw3rN9ACFyV85u
	 GDIwWOIAIcqoAFtzC44WJtW51ulknFrYxpq6FoUvOWsclSC+ESROlk+7QrCMgbnQsY
	 eYDwycxGzdnbO5frLY9q8b8ASW2Tr2al2rRBTSPZtsWGFFG5XxBkM5BsKTiBBw2UZL
	 fVNu5oCKclOJe1CHBBpjQNlVrN2bzBgideQbiDkEJDpOKoPiTg7s8H0K+sUG7zuwDq
	 rbnO1V4xD/Jakfo4i9iMgpN4h8hSKuwAeegrdW7qAxHSM8ngP7BcvYn9m6LI7zTfNN
	 QAWV44HJHMgmw==
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-Id: <172718747303.94652.4109324297463223522.b4-ty@kernel.org>
Date: Tue, 24 Sep 2024 16:17:53 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Mon, 27 May 2024 15:34:48 +0200, Geert Uytterhoeven wrote:
> Add support for the drm_panic module, which displays a message on
> the screen when a kernel panic occurs.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime


