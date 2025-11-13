Return-Path: <linux-renesas-soc+bounces-24553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5003C577F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 13:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0420E3BBEC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 12:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395023502B1;
	Thu, 13 Nov 2025 12:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0T+yyxh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9535029F;
	Thu, 13 Nov 2025 12:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038272; cv=none; b=tbcFxwd7xC109Ydmykd3Otvq5sEtm9XxTXdrL8RLdugREZnU2Mplmj2e+aXBTR5CqLQaH+OUxDr7fHAKPj0cmG0VIoZ3fTiXJcEOdYdhAD6nwosQymPjQwq67oQU+RaExuP6XUXp6oB5fvXw2Hm2Z3hSkZvoYfgn5AUfRhGCN7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038272; c=relaxed/simple;
	bh=UXAXTE2YFK7QvC/Dt9ZLRi3M39iCRLseej2ogxIsteo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AgSPhUJU2FJDy4I+dCNE74xOBlPSNxk2DZru37C2ty+Tace0jC1ZqoYgiNx/SdZyq0ZtcfV0LILZ0stUFFfwir4EcQVcZhadM3nnnMKYQuFXI6AyI7wcoMjQIhIgcRG8RFpuDK/DygD1KmKMeNCRdemHelD84CVEq+RN81qM+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0T+yyxh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF80FC113D0;
	Thu, 13 Nov 2025 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763038271;
	bh=UXAXTE2YFK7QvC/Dt9ZLRi3M39iCRLseej2ogxIsteo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M0T+yyxhlEMKfzu6caIBqBivhdEnjwT4AigNZzTAialQ4ZLWo3BEDcnDVBBKjq1u7
	 LD9ywx/sx8OteLIl971Y9BSUrJ4yq4Gi5e3FMOHUvPTJlEpDcTaYb6281ZL3Yu42UE
	 hBkNIsmO/Ec1ZmttzOarvabtS8iN3gl23tmW7+FFDWVrZIWr6lF/fVzk8B6S+Embd+
	 +8AH5jmplNt0IoU+LvKq3a4PJJXq/+9hddM/jlC302pWcOeNi51hqDzO6oxHuw6m2u
	 oo//5UZGskFurXuTGitmJHwYtENXv108o1C3yEbBy2thoObQwt4n03rDtspk2+j/Iu
	 ditgfeFXnDEiQ==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, geert+renesas@glider.be, magnus.damm@gmail.com, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251112065709.1522-1-vulab@iscas.ac.cn>
References: <20251112065709.1522-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: rsnd: fix OF node reference leak in
 rsnd_ssiu_probe()
Message-Id: <176303826968.17893.10351782135097925928.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 12:51:09 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 12 Nov 2025 14:57:09 +0800, Haotian Zhang wrote:
> rsnd_ssiu_probe() leaks an OF node reference obtained by
> rsnd_ssiu_of_node(). The node reference is acquired but
> never released across all return paths.
> 
> Fix it by declaring the device node with the __free(device_node)
> cleanup construct to ensure automatic release when the variable goes
> out of scope.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe()
      commit: 360b3730f8eab6c4467c6cca4cb0e30902174a63

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


