Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36265372A8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 14:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbhEDNAw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 09:00:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:36664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230447AbhEDNAw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 09:00:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38441613B4;
        Tue,  4 May 2021 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620133197;
        bh=AIFPmLnNsK7vOKv1yx0o9Xn8B02nNKPnP50cKazVY6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iKlxRckIoMOOKYphL+NTr+8fD/IMXWO9Y7BvR08dNq6Cu9QIqTQWOy1rIoRyHC1gG
         ilbkvqTJWSSSPiUBnGJqnGm9V+5bteBbihlhy9oV3CUOFctumLasfjrvxeliFvybHZ
         ea6A7j6wR8gbws1f/4D5vE8+Fa1xkD40NAURfiRo=
Date:   Tue, 4 May 2021 14:59:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] debugfs: only accept read attributes for blobs
Message-ID: <YJFFSxOh2M27vtX+@kroah.com>
References: <20210504121721.43385-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504121721.43385-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 04, 2021 at 02:17:20PM +0200, Wolfram Sang wrote:
> Blobs can only be read. So, keep only 'read' file attributes because the
> others will not work and only confuse users.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> I was confused for a second, thinking blobs can be written to. I will
> fix the few in-kernel users doing it wrong seperately.
> 
>  fs/debugfs/file.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
> index 686e0ad28788..d6aa6e04b7af 100644
> --- a/fs/debugfs/file.c
> +++ b/fs/debugfs/file.c
> @@ -890,7 +890,8 @@ static const struct file_operations fops_blob = {
>  /**
>   * debugfs_create_blob - create a debugfs file that is used to read a binary blob
>   * @name: a pointer to a string containing the name of the file to create.
> - * @mode: the permission that the file should have
> + * @mode: the read permission that the file should have (other permissions are
> + * 	  masked out)
>   * @parent: a pointer to the parent dentry for this file.  This should be a
>   *          directory dentry if set.  If this parameter is %NULL, then the
>   *          file will be created in the root of the debugfs filesystem.
> @@ -914,7 +915,7 @@ struct dentry *debugfs_create_blob(const char *name, umode_t mode,
>  				   struct dentry *parent,
>  				   struct debugfs_blob_wrapper *blob)
>  {
> -	return debugfs_create_file_unsafe(name, mode, parent, blob, &fops_blob);
> +	return debugfs_create_file_unsafe(name, mode & S_IRUGO, parent, blob, &fops_blob);

Can you use an octal number for this?  I think checkpatch.pl will
complain here.

thanks,

greg k-h
